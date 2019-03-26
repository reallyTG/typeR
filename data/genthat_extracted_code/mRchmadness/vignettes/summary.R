## ---- echo = FALSE, message = FALSE--------------------------------------
knitr::opts_chunk$set(collapse = TRUE, comment = "#>")
library(mRchmadness)

## ---- eval = FALSE-------------------------------------------------------
#  games.2017 = scrape.game.results(2017)

## ---- eval = FALSE-------------------------------------------------------
#  pred.pop.2017 = scrape.population.distribution(2017)

## ------------------------------------------------------------------------
head(games.men.2017)
head(pred.pop.men.2017)

## ------------------------------------------------------------------------
head(teams.men)

## ------------------------------------------------------------------------
set.seed(1)
prob.matrix = bradley.terry(games = games.men.2017)
prob.matrix["153", "150"]

## ------------------------------------------------------------------------
head(pred.538.men.2017)

## ------------------------------------------------------------------------
head(bracket.men.2017)

## ----dpi=150,fig.height=6,fig.width=8,out.height="500px",out.width="700px"----
set.seed(2017)
outcome = sim.bracket(bracket.empty = bracket.men.2017,
  prob.matrix = prob.matrix)
draw.bracket(bracket.empty = bracket.men.2017, bracket.filled = outcome)

## ----dpi=150,fig.height=6,fig.width=8,out.height="500px",out.width="700px"----
set.seed(42)
my.bracket = find.bracket(bracket.empty = bracket.men.2017,
  prob.matrix = prob.matrix, num.candidates = 100, num.sims = 1000,
  criterion = "win", pool.size = 30, bonus.round = c(1, 2, 4, 8, 16, 32),
  bonus.seed = rep(0, 16), bonus.combine = "add")
draw.bracket(bracket.empty = bracket.men.2017, bracket.filled = my.bracket)

## ------------------------------------------------------------------------
set.seed(8675309)
test = test.bracket(bracket.empty = bracket.men.2017,
  bracket.picks = my.bracket, prob.matrix = prob.matrix, pool.size = 30,
  num.sims = 1000, bonus.round = c(1, 2, 4, 8, 16, 32),
  bonus.seed = rep(0, 16), bonus.combine = "add")
hist(test$score, breaks = 20)
hist(test$percentile, breaks = 20)
mean(test$win)

