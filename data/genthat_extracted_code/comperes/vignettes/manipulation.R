## ----setup, include = FALSE----------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ----library, warning = FALSE--------------------------------------------
library(comperes)
library(dplyr)
library(rlang)

## ----cr_long-------------------------------------------------------------
cr_long <- tibble(
  game   = c("a1", "a1", "a1", "a2", "a2", "b1", "b1", "b2"),
  player = c(1, NA, NA, 1, 2, 2, 1, 2),
  score  = 1:8,
  season = c(rep("A", 5), rep("B", 3))
) %>%
  as_longcr()

## ----item-summary--------------------------------------------------------
cr_long %>% summarise_player(mean_score = mean(score))

cr_long %>% summarise_game(min_score = min(score), max_score = max(score))

cr_long %>% summarise_item("season", sd_score = sd(score))

## ----item-summary-join---------------------------------------------------
cr_long %>%
  join_item_summary("season", season_mean_score = mean(score)) %>%
  mutate(score = score - season_mean_score)

## ----summary_funs--------------------------------------------------------
# Use .prefix to add prefix to summary columns
cr_long %>%
  join_player_summary(!!!summary_funs[1:2], .prefix = "player_") %>%
  join_item_summary("season", !!!summary_funs[1:2], .prefix = "season_")

## ----matchups------------------------------------------------------------
get_matchups(cr_long)

## ----h2h_long------------------------------------------------------------
cr_long %>%
  h2h_long(
    abs_diff = mean(abs(score1 - score2)),
    num_wins = sum(score1 > score2)
  )

## ----h2h_mat-------------------------------------------------------------
cr_long %>% h2h_mat(sum_score = sum(score1 + score2))

## ----h2h_funs------------------------------------------------------------
cr_long %>% h2h_long(!!!h2h_funs)

## ----h2h-factors---------------------------------------------------------
cr_long_fac <- cr_long %>%
  mutate(player = factor(player, levels = c(1, 2, 3)))

cr_long_fac %>%
  h2h_long(abs_diff = mean(abs(score1 - score2)),
           fill = list(abs_diff = -100))

cr_long_fac %>%
  h2h_mat(mean(abs(score1 - score2)),
          fill = -100)

## ----h2h-conversion------------------------------------------------------
cr_long %>% h2h_mat(mean(score1)) %>% to_h2h_long()

cr_long %>%
  h2h_long(mean_score1 = mean(score1), mean_score2 = mean(score2)) %>%
  to_h2h_mat()

## ----convert-pair-value--------------------------------------------------
pair_value_long <- tibble(
  key_1 = c(1, 1, 2),
  key_2 = c(2, 3, 3),
  val = 1:3
)

pair_value_mat <- pair_value_long %>%
  long_to_mat(row_key = "key_1", col_key = "key_2", value = "val")
pair_value_mat

pair_value_mat %>%
  mat_to_long(
    row_key = "key_1", col_key = "key_2", value = "val",
    drop = TRUE
  )

## ----pairgames-----------------------------------------------------------
to_pairgames(cr_long)

