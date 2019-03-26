## ----setup, message = FALSE, warning = FALSE-----------------------------
library(ballr)

## ---- message = F, warning = F-------------------------------------------
library(magrittr)
library(ggplot2)
library(janitor)
library(scales)

## ---- message = F, warning = F-------------------------------------------
standings <- NBAStandingsByDate() # "YEAR-MO-DY"
standings

## ------------------------------------------------------------------------
standings <- NBAStandingsByDate("2015-12-31")
standings

## ------------------------------------------------------------------------
players <- NBAPerGameStatistics()
players

## ------------------------------------------------------------------------
players <- NBAPerGameStatistics(season = 2017)

## ------------------------------------------------------------------------
players %>%
  dplyr::filter(mp > 20, pos %in% c("SF")) %>%
  dplyr::select(player, link) %>%
  dplyr::distinct()

## ------------------------------------------------------------------------
players <- NBAPerGameStatisticsPer36Min(season = 2017)

## ------------------------------------------------------------------------
players

## ------------------------------------------------------------------------
players <- NBAPerGameStatisticsPer36Min(season = 2017) %>%
  dplyr::filter(pos %in% c("C", "PF")) %>%
  dplyr::top_n(n = 10, pts) %>% 
  dplyr::select(player, link) %>%
  dplyr::distinct()

## ------------------------------------------------------------------------
players

## ------------------------------------------------------------------------
player_stats <- NBAPlayerPerGameStats(players[1, 2]) %>%
  dplyr::filter(!is.na(age)) %>%
  dplyr::mutate(player = as.character(players[1, 1]))

## ------------------------------------------------------------------------
for(i in 2:dim(players)[1]){
  tmp <- NBAPlayerPerGameStats(players[i, 2]) %>%
    dplyr::filter(!is.na(age)) %>%
    dplyr::mutate(player = as.character(players[i, 1]))
  player_stats <- dplyr::bind_rows(player_stats, tmp)
}

## ------------------------------------------------------------------------
p <- ggplot2::ggplot(data = player_stats,
            aes(x = age, y = efgpercent, group = player))
p + ggplot2::geom_line(alpha = .25) +
  ggplot2::geom_point(alpha = .25) +
  ggplot2::scale_y_continuous("effective field goal %age", limit = c(0, 1),
                     labels = percent) +
  ggplot2::geom_line(data = dplyr::filter(player_stats, player == "Anthony Davis"),
            aes(x = age, y = efgpercent), size = 1, col = "#1f78b4") +
  ggplot2::geom_point(data = dplyr::filter(player_stats, player == "Anthony Davis"),
            aes(x = age, y = efgpercent), size = 1, col = "#1f78b4") +
  ggplot2::geom_line(data = dplyr::filter(player_stats, player == "DeMarcus Cousins"),
            aes(x = age, y = efgpercent), size = 1, col = "#33a02c") +
  ggplot2::geom_point(data = dplyr::filter(player_stats, player == "DeMarcus Cousins"),
             aes(x = age, y = efgpercent), size = 1, col = "#33a02c") +
  ggplot2::theme_bw()


## ------------------------------------------------------------------------
per_100 <- NBAPerGameStatisticsPer100Poss(season = 2018)
utils::head(per_100)

## ------------------------------------------------------------------------
adv_stats <- NBAPerGameAdvStatistics(season = 2018)
utils::head(adv_stats)

## ------------------------------------------------------------------------
library(rvest)

url <- "http://www.basketball-reference.com/teams/DEN/2017.html"
links <- xml2::read_html(url) %>%
    rvest::html_nodes(".center+ .left a") %>%
    rvest::html_attr('href')

## ------------------------------------------------------------------------
links 

