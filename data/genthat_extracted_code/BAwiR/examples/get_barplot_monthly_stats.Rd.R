library(BAwiR)


### Name: get_barplot_monthly_stats
### Title: Barplots with monthly stats
### Aliases: get_barplot_monthly_stats

### ** Examples

## Not run: 
##D library(dplyr)
##D compet <- "ACB"
##D df <- do_join_games_bio(compet, acb_games_1718, acb_players_1718)
##D df1 <- do_add_adv_stats(df)
##D 
##D months <- c(df %>% distinct(Month))$Month
##D months_order <- c("September", "October", "November", "December", 
##D                   "January", "February", "March", "April", "May", "June")
##D months_plot <- match(months_order, months)
##D months_plot1 <- months_plot[!is.na(months_plot)]
##D months_plot2 <- months[months_plot1]
##D 
##D df3_m <- df1 %>%
##D filter(Team == "Real_Madrid", 
##D       Player.x == "Doncic, Luka") %>%
##D  group_by(Month) %>%
##D  do(do_stats(., "Average", "2017-2018", "ACB", "Regular Season")) %>%
##D  ungroup() %>%
##D  mutate(Month = factor(Month, levels = months_plot2)) %>%
##D  arrange(Month)
##D 
##D stats <- c("GP", "MP", "PTS", "FGA", "FGPerc", "ThreePA", 
##D            "ThreePPerc", "FTA", "FTPerc",
##D            "TRB", "ORB", "AST", "TOV", "STL")
##D            
##D df3_m1 <- df3_m %>%
##D   select(1:5, stats, 46:50)
##D get_barplot_monthly_stats(df3_m1, paste("; ACB", "2017-2018", "Average", sep = " ; "), 
##D                           2.5)
##D 
##D # For all teams and players:
##D teams <- as.character(sort(unique(df1$Team)))
##D df3_m <- df1 %>%
##D filter(Team == teams[13]) %>%
##D  group_by(Month) %>%
##D  do(do_stats(., "Average", "2017-2018", "ACB", "Regular Season")) %>%
##D  ungroup() %>%
##D  mutate(Month = factor(Month, levels = months_plot2)) %>%
##D  arrange(Month)
##D 
##D df3_m1 <- df3_m %>%
##D   select(1:5, stats, 46:50)
##D 
##D for (i in unique(df3_m1$Name)) {
##D   print(i)
##D   print(get_barplot_monthly_stats(df3_m1 %>% filter(Name == i), 
##D                                   paste(" ; ACB", "2017-2018", "Average", sep = " ; "), 
##D                                   2.5))
##D }
## End(Not run)




