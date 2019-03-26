library(BAwiR)


### Name: get_stats_seasons
### Title: Season-by-season stats
### Aliases: get_stats_seasons

### ** Examples

## Not run: 
##D competition <- "ACB"
##D df <- do_join_games_bio("ACB", acb_games_1718, acb_players_1718)
##D df$Compet <- competition
##D player <- "Carroll, Jaycee"
##D variabs <- c("GP", "MP", "PTS", "EFGPerc", "TRB", "AST", "TOV", "PIR")
##D plot_yearly <- get_stats_seasons(df, competition, player, variabs, "All", TRUE, TRUE)
##D plot_yearly$gg
##D # There are only games from the regular season in this demo data frame.
##D plot_yearly1 <- get_stats_seasons(df, competition, player, variabs, "Regular Season", 
##D                                   TRUE, TRUE)
##D plot_yearly1$gg
## End(Not run)




