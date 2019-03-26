## ----setup, include = FALSE----------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ----library, warning = FALSE--------------------------------------------
library(comperes)
library(tibble)

## ----cr_long_raw---------------------------------------------------------
cr_long_raw <- tibble(
  game   = c(1,  1,  1, 2, 2, 3, 3, 4),
  player = c(1, NA, NA, 1, 2, 2, 1, 2),
  score  = 1:8
)

## ----cr_long-------------------------------------------------------------
cr_long <- as_longcr(cr_long_raw)
cr_long

## ----as_longcr-repair----------------------------------------------------
tibble(
  PlayerRS = "a",
  gameSS = "b",
  extra = -1,
  score_game = 10,
  player = 1
) %>%
  as_longcr()

## ----cr_wide_raw---------------------------------------------------------
cr_wide_raw <- tibble(
  player1 = c(1, 1, 2),
  score1  = -(1:3),
  player2 = c(2, 3, 3),
  score2  = -(4:6)
)

## ----cr_wide-------------------------------------------------------------
cr_wide <- cr_wide_raw %>% as_widecr()
cr_wide

## ----as_widecr-repair----------------------------------------------------
tibble(
  score = 2,
  PlayerRS = "a",
  scoreRS = 1,
  player = "b",
  player1 = "c",
  extra = -1,
  game = "game"
) %>%
  as_widecr()

## ----conversion----------------------------------------------------------
as_longcr(cr_wide)

# Determines number of players in game as
# actual maximum number of players in games
as_widecr(cr_long)

