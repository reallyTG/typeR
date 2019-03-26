## ----setup, include = FALSE----------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ----library-------------------------------------------------------------
library(rlang)

# This also loads comperes package
suppressPackageStartupMessages(library(comperank))

## ----ncaa2005-long-------------------------------------------------------
ncaa2005

## ----ncaa2005-wide-------------------------------------------------------
comperes::as_widecr(ncaa2005)

## ----massey--------------------------------------------------------------
rate_massey(ncaa2005)

rank_massey(ncaa2005)

rank_massey(ncaa2005, keep_rating = TRUE)

## ----colley--------------------------------------------------------------
rank_colley(ncaa2005, keep_rating = TRUE)

## ----h2h-examples--------------------------------------------------------
# Examples of h2h_funs elements
names(h2h_funs)

h2h_funs[1:3]

# Computing Head-to-Head values with unquoting
comperes::h2h_long(ncaa2005, !!! h2h_funs)

comperes::h2h_mat(ncaa2005, !!! h2h_funs["mean_score"])

# Computing Head-to-Head values manually
comperes::h2h_mat(ncaa2005, mean(score1))

# To account for self play use `if-else`
comperes::h2h_mat(ncaa2005, if(player1[1] == player2[1]) 0 else mean(score1))

## ----keener--------------------------------------------------------------
rank_keener(ncaa2005, !!! h2h_funs["mean_score"], keep_rating = TRUE)

## ----markov--------------------------------------------------------------
rank_markov(ncaa2005, !!! h2h_funs["num_wins"], keep_rating = TRUE)

rank_markov(
  ncaa2005,
  !!! h2h_funs[c("num_wins", "mean_score_diff_pos")],
  weights = c(0.2, 0.8),
  keep_rating = TRUE
)

## ----offense-defense-----------------------------------------------------
rank_od(
  ncaa2005,
  if (player1[1] == player2[1]) 0 else mean(score1),
  keep_rating = TRUE
)

## ----iterative-----------------------------------------------------------
# Adds 1 to winner's rating and subtracts 1 from loser's rating
test_rate_fun <- function(rating1, score1, rating2, score2) {
  c(rating1, rating2) + ((score1 >= score2) * 2 - 1) * c(1, -1)
}
add_iterative_ratings(ncaa2005, test_rate_fun)

# Revert the order of games
ncaa2005_rev <- ncaa2005
ncaa2005_rev$game <- 11 - ncaa2005_rev$game
add_iterative_ratings(ncaa2005_rev, test_rate_fun)

# Rating after the last game
rank_iterative(ncaa2005, test_rate_fun, keep_rating = TRUE)

## ----elo-----------------------------------------------------------------
add_elo_ratings(ncaa2005)
add_elo_ratings(ncaa2005_rev)

rank_elo(ncaa2005, keep_rating = TRUE)
rank_elo(ncaa2005_rev, keep_rating = TRUE)

