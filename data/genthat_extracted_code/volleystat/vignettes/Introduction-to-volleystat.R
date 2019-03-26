## ----setup, include = FALSE----------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ----include=FALSE-------------------------------------------------------
  
  library(dplyr)
  library(ggplot2)

  data(matches, package = "volleystat")
  data(players, package = "volleystat")
  data(matchstats, package = "volleystat")
  data(staff, package = "volleystat")
  data(sets, package = "volleystat")


## ---- echo=FALSE---------------------------------------------------------
knitr::kable(
matches %>% 
group_by(league_gender, match) %>% 
summarise(obs = n())
)

## ----echo=FALSE----------------------------------------------------------
knitr::kable(
matches %>% filter(match == "home") %>% 
group_by(league_gender, season_id) %>%  
summarize(n_matches = n())
)

## ----echo=FALSE----------------------------------------------------------
knitr::kable(matches %>% filter(match == "home") %>% 
group_by(league_gender, competition_stage) %>%  summarize(n_matches = n()))

## ----echo=TRUE, fig.height=4, fig.show='hold', fig.width=7, message=FALSE, warning=FALSE----
matches %>% filter(match == "home") %>% 
group_by(league_gender) %>% select(league_gender, spectators)  %>%
ggplot(aes(x = factor(league_gender), y = spectators)) + 
geom_violin()

## ----echo=TRUE, fig.height=4, fig.show='hold', fig.width=7, message=FALSE, warning=FALSE----
matches %>% filter(match == "home") %>% 
group_by(league_gender) %>% select(league_gender, match_duration, set_won)  %>%
ggplot(aes(x = match_duration)) + 
geom_histogram(position = "dodge") +
facet_grid(.~factor(league_gender))

## ----echo=TRUE, message=FALSE, warning=FALSE-----------------------------
knitr::kable(
matches %>% filter(season_id == 1314) %>% 
group_by(league_gender, team_name) %>%  
summarize(n_matches = n()))

## ----echo=TRUE, message=FALSE, warning=FALSE, paged.print=TRUE-----------
knitr::kable(
matches %>% 
filter(match == "home", season_id == 1516) %>% 
mutate(match_won = ifelse(set_won == 3, "wins", "losses")) %>%
group_by(league_gender, match_won) %>%  
summarize(n_matches = n())
)

## ----echo=TRUE, message=FALSE, warning=FALSE, paged.print=TRUE-----------
knitr::kable(
sets %>% 
filter(match == "home") %>% 
group_by(set) %>%  
summarize(obs = n(),
          mean_duration = mean(set_duration, na.rm = TRUE))
)

## ------------------------------------------------------------------------
knitr::kable(
players %>%
filter(season_id == 1718) %>% 
group_by(gender, position) %>% 
summarise(obs = n(),
          mean_height = mean(height),
          sd_height = sd(height),
          min_height = min(height),
          max_height = max(height)))

## ----echo=TRUE, message=TRUE, warning=TRUE, paged.print=TRUE-------------
knitr::kable(
staff %>%
filter(season_id == 1415, position == "Coach") %>% 
select(league_gender, team_name, firstname, lastname, nationality) %>% 
arrange(league_gender, team_name)
)

## ----echo=TRUE, message=TRUE, warning=TRUE, paged.print=TRUE-------------
knitr::kable(
players %>% 
filter(team_id == 2009, season_id == 1617, position == "Libero") %>% 
left_join(matchstats, by = c("season_id" = "season_id", 
                             "team_id" = "team_id", 
                             "player_id" = "player_id")) %>% 
arrange(match_id) %>% 
select(season_id, team_name, firstname, lastname, match_id, starts_with("rec_")))

## ----echo=TRUE, message=TRUE, warning=TRUE, paged.print=TRUE-------------
knitr::kable(
players %>%
filter(team_id == 2009, season_id == 1617, position == "Libero") %>% 
left_join(matchstats, by = c("season_id" = "season_id", 
                             "team_id" = "team_id",
                             "player_id" = "player_id")) %>% 
select(rec_tot, rec_err) %>% 
summarise(rec_tot_sum = sum(rec_tot),
          rec_err_tot = sum(rec_err))
)

