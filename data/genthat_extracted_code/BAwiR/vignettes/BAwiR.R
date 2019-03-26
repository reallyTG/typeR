## ----setup, include=FALSE------------------------------------------------
knitr::opts_chunk$set(echo = TRUE)

## ----packages, message=FALSE, eval=FALSE---------------------------------
#  # Firstly, load BAwiR and other packages that will be used in the paper:
#  library(BAwiR) # 1.2
#  library(tidyverse) # 1.2.1
#  library(FSA) # 0.8.22
#  library(gridExtra) # 2.3

## ----figure 1, eval=FALSE------------------------------------------------
#  # Code for Figure 1:
#  # Load the data_app_acb file with the ACB games from the 1985-1986 season to the 2017-2018 season:
#  load(url("http://www.uv.es/vivigui/softw/data_app_acb.RData"))
#  title <- " Number of Spanish and foreign players along the ACB seasons \n Data from www.acb.com"
#  get_pop_pyramid(data_app_acb, title, "eng")

## ----data, message=FALSE, eval=FALSE-------------------------------------
#  # Create the data with games and players' info, add the advanced stats and compute the total numbers:
#  df0 <- do_join_games_bio("ACB", acb_games_1718, acb_players_1718)
#  df1 <- do_add_adv_stats(df0)
#  df2 <- do_stats(df1, "Total", "2017-2018", "ACB", "Regular Season")

## ----figure 2, eval=FALSE------------------------------------------------
#  # Code for Figure 2:
#  df3 <- df2[which(df2$Position == "Center"), c("MP", "PTS", "Name", "CombinID")]
#  df3 <- df3[df3$MP > 100,]
#  ggplot(df3, aes(x = c(df3[,1])[[1]], y = c(df3[,2])[[1]], group = Name)) +
#    geom_point() +
#    geom_text(aes(label = Name), size = 2, vjust = -0.8) +
#    labs(x = colnames(df3)[1], y = colnames(df3)[2],
#         title = "ACB 2017-2018, Regular Season. Total stats. Centers.")

## ----table 2, eval=FALSE-------------------------------------------------
#  # Code for Table 2:
#  df4 <- df3 %>%
#    mutate(Player_info = paste("http://www.acb.com/jugador.php?id=", CombinID, sep = "")) %>%
#    select(-CombinID)
#  df5 <- df4[order(df4[,1][[1]], decreasing = TRUE),]
#  headtail(df5, 3)

## ----figure 3, eval=FALSE------------------------------------------------
#  # Code for Figure 3:
#  stats <- c("GP", "MP", "PTS", "FGPerc", "FTPerc", "TRB", "AST", "TOV", "PlusMinus", "PIR")
#  descr_stats <- c("Games played", "Minutes played", "Points", "Field goals percentage",
#                   "Free throws percentage", "Total rebounds", "Assists", "Turnovers",
#                   "Plus/minus", "Performance index rating")
#  df2_1 <- df2 %>%
#    select(1:5, stats, 46:49)
#  
#  perc_plot_doncid <- get_bubble_plot(df2_1, "Doncic, Luka", descr_stats, 3, 7, 8) +
#                          theme(strip.text.x = element_blank()) +
#                          ggtitle(label = "Doncic, Luka",
#                                  subtitle = "ACB 2017-2018, Regular Season. Total stats.") +
#                          theme(plot.title = element_text(size = 20))
#  
#  perc_plot_abalde <- get_bubble_plot(df2_1, "Abalde, Alberto", descr_stats, 3, 7, 8) +
#                          theme(strip.text.x = element_blank()) +
#                          ggtitle(label = "Abalde, Alberto",
#                                  subtitle = "ACB 2017-2018, Regular Season. Total stats.") +
#                          theme(plot.title = element_text(size = 20))
#  
#  grid.arrange(perc_plot_doncid, perc_plot_abalde, ncol = 2)

## ----figure 4, message=FALSE, eval=FALSE---------------------------------
#  # Code for Figure 4:
#  months <- c(df0 %>% distinct(Month))$Month
#  months_order <- c("September", "October", "November", "December",  "January",
#                    "February", "March", "April", "May", "June")
#  months_plot <- match(months_order, months)
#  months_plot1 <- months_plot[!is.na(months_plot)]
#  months_plot2 <- months[months_plot1]
#  
#  df1_m <- df1 %>%
#                filter(Player.x %in% c("Doncic, Luka", "Abalde, Alberto")) %>%
#                group_by(Month) %>%
#                do(do_stats(., "Average", "2017-2018", "ACB", "Regular Season")) %>%
#                ungroup() %>%
#                mutate(Month = factor(Month, levels = months_plot2)) %>%
#                arrange(Month)
#  
#  df1_m1 <- df1_m %>%
#    select(1:5, stats, 46:50) %>%
#    select(-EPS)
#  max_val <- max(df1_m1[,colnames(df1_m1) %in% stats])
#  min_val <- min(df1_m1[,colnames(df1_m1) %in% stats])
#  get_barplot_monthly_stats(df1_m1, "ACB 2017-2018, Regular Season. Monthly average stats.", 3) +
#    scale_y_continuous(limits = c(min_val - 10, max_val + 10))

## ----figure 5, message=FALSE, eval=FALSE---------------------------------
#  # Code for Figure 5:
#  df0$Compet <- "ACB"
#  plot_yearly <- get_stats_seasons(df0, "ACB", c("Doncic, Luka", "Abalde, Alberto"),
#                                   stats[1:4], "Regular Season", TRUE, FALSE)
#  plot_yearly$gg +
#    labs(title = "ACB 2017-2018, Regular Season. Yearly average stats.") +
#    theme(strip.text.x = element_text(size = 15))

## ----figure 6, message=FALSE, eval=FALSE---------------------------------
#  # Code for Figure 6:
#  levels_stats <- list("Offensive" = c("PTS", "FG", "FGA", "FGPerc",
#                                       "TwoP", "TwoPA", "TwoPPerc",
#                                       "ThreeP", "ThreePA", "ThreePPerc",
#                                       "FT", "FTA", "FTPerc", "ORB", "AST"),
#                       "Defensive" = c("DRB", "STL", "PF"),
#                       "Other" = c("GP", "MP", "TRB", "PlusMinus", "PIR"),
#                       "Advanced" = c("EFGPerc", "PPS"))
#  get_heatmap_bb(df2, "Real_Madrid", levels_stats, "PlusMinus", 9,
#                 paste("ACB", "2017-2018, Regular Season.", "Total stats.", sep = " "))

## ----figure 7, eval=FALSE------------------------------------------------
#  # Code for Figure 7:
#  get_shooting_plot(df2, "Real_Madrid", 3, 1, "ACB 2017-2018, Regular Season.", "en") +
#    theme(plot.title = element_text(size = 15))

## ----figure 8, eval=FALSE------------------------------------------------
#  # Code for Figure 8:
#  df1_10 <- df1 %>%
#    filter(Day <= 10)
#  teams <- as.character(rev(sort(unique(df2$Team))))
#  df_four_factors <- do_four_factors_df(df1_10, teams)
#  get_four_factors_plot(df_four_factors$df_rank, df_four_factors$df_no_rank,
#                        c("Real_Madrid", "Valencia"), "en") +
#    ggtitle("ACB 2017-2018, Regular Season.")

## ----figure 9, eval=FALSE------------------------------------------------
#  # Code for Figure 9:
#  df0$Compet <- "ACB"
#  gg <- get_table_results(df0, "ACB", "2017-2018")
#  gg$plot_teams

## ----figure 10, eval=FALSE-----------------------------------------------
#  # Code for Figure 10:
#  get_map_nats(df2) +
#    ggtitle("ACB 2017-2018, Regular Season.")

## ----session info--------------------------------------------------------
sessionInfo()

