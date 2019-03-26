library(BAwiR)


### Name: do_OE
### Title: Offensive Efficiency (OE)
### Aliases: do_OE

### ** Examples

df <- do_join_games_bio("ACB", acb_games_1718, acb_players_1718)
df1 <- do_add_adv_stats(df)
# Players with OE = 0:
# df1[55, c("Player.x", "FG", "AST", "FGA", "ORB", "TOV")]
# Player.x     FG  AST  FGA  ORB  TOV
# Triguero, J.  0    0    0    0    0
# OE can be greater than 1, for example:
# df1[17, c("Player.x", "FG", "AST", "FGA", "ORB", "TOV")]
# Player.x        FG  AST  FGA  ORB  TOV
# Diagne, Moussa   3    0    3    1    0
do_OE(df1[1,])




