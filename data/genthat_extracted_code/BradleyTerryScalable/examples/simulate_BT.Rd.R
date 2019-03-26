library(BradleyTerryScalable)


### Name: simulate_BT
### Title: This function simulates one or more pseudo-random datasets from
###   a specified Bradley-Terry model.  Counts are simulated from
###   independent binomial distributions, with the binomial probabilities
###   and totals specified through the function arguments.
### Aliases: simulate_BT simulate.btfit

### ** Examples

set.seed(1)
n <- 6
N <- matrix(rpois(n ^ 2, lambda = 1), n, n)
N <- N + t(N) ; diag(N) <- 0
p <- exp(rnorm(n)/4)
names(p) <- rownames(N) <- colnames(N) <- letters[1:6]
simulate_BT(p, N, seed = 6)
citations_btdata <- btdata(BradleyTerryScalable::citations)
fit1 <- btfit(citations_btdata, 1)
simulate(fit1, nsim = 2, seed = 1)
toy_df_4col <- codes_to_counts(BradleyTerryScalable::toy_data, c("W1", "W2", "D"))
toy_btdata <- btdata(toy_df_4col)
fit2 <- btfit(toy_btdata, 1, subset = function(x) "Amy" %in% x)
fit2_sim <- simulate(fit2, nsim = 3, result_class = "btdata")
fit2_sim$sim_1
purrr::map(fit2_sim, "wins")




