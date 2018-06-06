//倒數後生成武器
//當在第一場景時
if room_number == 1
{
   count_down += 1;
   count_down = clamp(count_down,0,1001);
}
if count_down == 1000
{
   drop();
}
//當在第二場景時
if room_number == 2
{
   count_down += 1;
   count_down = clamp(count_down,0,2301);
}
if count_down == 2000
{
   drop();
}
if count_down == 2300
{
  if RG_drop_random == 1 
  {
    instance_create_depth(2550,120,0,gun_RG_drop);
  }
  else
  {
    instance_create_depth(2550,120,0,gun_SG_drop);
  }
}
//當在第三場景時
if room_number == 3
{
   count_down += 1;
   count_down = clamp(count_down,0,3301);
}
if count_down == 3300
{
   drop();
}

//當Bo3比分一方達到兩分時
if player1wins == 2 ||  player2wins == 2
{
   is_gameover = 1;
}

//勝負判斷
if !instance_exists(o_player) && is_gameover == 0
{
   o_player2.player_hp = 9999;
   if havewincount == 0
   {
	   player2wins ++;
	   havewincount ++;
   }
}
if is_gameover == 0 && !instance_exists(o_player) 
{
  if room_number <= 3 && o_player1_dead.dead_ani_count == 450
  {
   room_goto_next();
   is_planeext = 1;
   room_number ++;
   havewincount = 0;
   room_start = 0;
  }
}

if !instance_exists(o_player2) && is_gameover == 0 
{
   o_player.player_hp = 9999;
   if havewincount == 0
   {
	   player1wins ++;
	   havewincount ++;
   }
}
if is_gameover == 0 && !instance_exists(o_player2) 
{
  if room_number <= 3 && o_player2_dead.dead_ani_count == 450
  {
   room_goto_next();
   is_planeext = 1;
   room_number ++;
   havewincount = 0;
   room_start = 0;
  }
}

//房間計時器
room_start ++ ;
room_start = clamp(room_start,0,601);

