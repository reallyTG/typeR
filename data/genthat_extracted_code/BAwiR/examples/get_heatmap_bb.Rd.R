library(BAwiR)


### Name: get_heatmap_bb
### Title: Basketball heatmap
### Aliases: get_heatmap_bb

### ** Examples

## Not run: 
##D compet <- "ACB"
##D df <- do_join_games_bio(compet, acb_games_1718, acb_players_1718)
##D df1 <- do_add_adv_stats(df)
##D df2 <- do_stats(df1, "Total", "2017-2018", compet, "Regular Season")
##D teams <- as.character(rev(sort(unique(df2$Team))))
##D get_heatmap_bb(df2, teams[6], NULL, "MP", 9, paste(compet, "2017-2018", "Total", sep = " "))
## End(Not run)




