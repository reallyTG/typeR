library(BAwiR)


### Name: get_bubble_plot
### Title: Basketball bubble plot
### Aliases: get_bubble_plot

### ** Examples

## Not run: 
##D compet <- "ACB"
##D df <- do_join_games_bio(compet, acb_games_1718, acb_players_1718)
##D df1 <- do_add_adv_stats(df)
##D df2 <- do_stats(df1, "Total", "2017-2018", compet, "Regular Season")
##D # When choosing a subset of stats, follow the order in which they appear
##D # in the data frame.
##D stats <- c("GP", "MP", "PTS", "FGA", "FGPerc", "ThreePA", "ThreePPerc", 
##D            "FTA", "FTPerc", "TRB", "ORB", "AST", "STL", "TOV")
##D df2_1 <- df2[, c(1:5, which(colnames(df2) %in% stats), 46:49)]
##D descr_stats <- c("Games played", "Minutes played", "Points", 
##D                 "Field goals attempted", "Field goals percentage", 
##D                 "3-point field goals attempted", "3-point percentage", 
##D                 "FTA: Free throws attempted", "Free throws percentage", 
##D                 "Total rebounds", "Offensive rebounds", 
##D                 "Assists", "Steals", "Turnovers")
##D get_bubble_plot(df2_1, "Abalde, Alberto", descr_stats, 6, 10, 12)
## End(Not run)




