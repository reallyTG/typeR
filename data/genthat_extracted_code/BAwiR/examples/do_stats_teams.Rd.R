library(BAwiR)


### Name: do_stats_teams
### Title: Accumulated and average statistics for teams
### Aliases: do_stats_teams

### ** Examples

compet <- "ACB"
df <- do_join_games_bio(compet, acb_games_1718, acb_players_1718)
df$Compet <- compet
df_teams <- do_stats_teams(df, "2017-2018", "ACB", "Regular Season")
# Total statistics:
#df_teams$df_team_total
# Average statistics:
#df_teams$df_team_mean




