/*
**  Usage:
**      draw_hearts_row(heart,bar_length,hp,max_hp,bar_x,bar_y,xoffset,yoffset)
**
**  Arguments:
**      heart       sprite to use for hearts
**      bar_length  number of hearts in each row
**      hp          variable for current hp
**      max_hp      variable for maximum hp
**      bar_x       x position
**      bar_y       y position
**      xoffset     offset of each icon based on width
**                      1 for normal width
**                      -1 to draw right to left
**      yoffset     offset of each row based on height
**                      1 for normal height
**                      -1 to draw extra rows upward
**
**  Result:
**      draws a horizontal line of hearts / icons
**      on multiple rows like Legend of Zelda
**      can also be used for ammo, mana or other resources
**
**  GMLscripts.com
**
*/

//make sure your sprite has:
//a full heart icon at index 0
//an empty heart icon at the end

heart = argument0;
bar_length = argument1;
hp = argument2;
max_hp = argument3;
bar_x = argument4;
bar_y = argument5;
xoffset = argument6;
yoffset = argument7;

parts = sprite_get_number(heart) - 1
width = sprite_get_width(heart)
height = sprite_get_height(heart)
            
index = 0
bar = 0
//draw full hearts
    repeat(floor(hp / parts)){
        draw_sprite(heart,0,bar_x+width*xoffset*index,bar_y+height*yoffset*bar)
        index += 1
        if index = bar_length{
            bar +=1
            index = 0
        }
    }
//draw partial heart
    if hp mod parts >0{
        draw_sprite(heart,parts - hp mod parts,bar_x+width*xoffset*index,bar_y+height*yoffset*bar)
        index += 1
        if index = bar_length{
            bar +=1
            index = 0
        }
    }
//draw empty hearts
    repeat(floor(max_hp/parts - hp/parts)){
        draw_sprite(heart,parts,bar_x+width*xoffset*index,bar_y+height*yoffset*bar)
        index += 1
        if index = bar_length{
            bar +=1
            index = 0
        }
    }
