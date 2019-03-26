library(BAwiR)


### Name: get_four_factors_plot
### Title: Four factors plot
### Aliases: get_four_factors_plot

### ** Examples

## Not run: 
##D df <- do_join_games_bio("ACB", acb_games_1718, acb_players_1718)
##D df1 <- do_add_adv_stats(df)
##D team <- "Valencia"
##D df_four_factors <- do_four_factors_df(df1, team)
##D # If only one team is represented the ranking between parentheses is just one.
##D get_four_factors_plot(df_four_factors$df_rank, 
##D                       df_four_factors$df_no_rank, team, "en")
## End(Not run)




