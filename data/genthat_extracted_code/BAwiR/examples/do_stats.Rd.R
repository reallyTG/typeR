library(BAwiR)


### Name: do_stats
### Title: Accumulated or average statistics
### Aliases: do_stats

### ** Examples

compet <- "ACB"
df <- do_join_games_bio(compet, acb_games_1718, acb_players_1718)
df1 <- do_add_adv_stats(df)
df2 <- do_stats(df1, "Total", "2017-2018", compet, "Regular Season")
        



