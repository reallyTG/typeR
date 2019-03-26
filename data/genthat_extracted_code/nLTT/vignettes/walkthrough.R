## ----setup, include = FALSE----------------------------------------------
knitr::opts_chunk$set(fig.width = 7, fig.height = 7)

## ------------------------------------------------------------------------
    library(nLTT) #nolint
    set.seed(42)
    tree1 <- TESS::tess.sim.age(n = 1, age = 10, lambda = 0.4, mu = 0)[[1]]
    tree2 <- TESS::tess.sim.age(n = 1, age = 10, lambda = 0.25, mu = 0)[[1]]
    par(mfrow = c(1, 2))
    par(mar = c(2, 2, 2, 2))
    plot(tree1) 
    plot(tree2)

## ------------------------------------------------------------------------
    nltt_plot(tree1, col = "red")
    nltt_lines(tree2, col = "blue")
    legend("topleft", c("tree1", "tree2"), col = c("red", "blue"), lty = 1)

## ------------------------------------------------------------------------
nLTTstat(tree1, tree2) #nolint
nLTTstat_exact(tree1, tree2) #nolint

## ------------------------------------------------------------------------
set.seed(42)
trees1 <- TESS::tess.sim.age(n = 100, age = 10, lambda = 0.4, mu = 0)
trees2 <- TESS::tess.sim.age(n = 100, age = 10, lambda = 0.25, mu = 0)

## ------------------------------------------------------------------------
par(mfrow = c(1, 2))
nltts_plot(trees1, dt = 0.001, plot_nltts = TRUE, 
           col = "red", main = "lambda = 0.4")
nltts_plot(trees2, dt = 0.001, plot_nltts = TRUE, 
           col = "blue", main = "lambda = 0.25")

## ------------------------------------------------------------------------
m1 <- get_average_nltt_matrix(trees1, dt = 0.001)
m2 <- get_average_nltt_matrix(trees2, dt = 0.001)

## ------------------------------------------------------------------------
m1 <- get_average_nltt_matrix(trees1, dt = 0.001)
m2 <- get_average_nltt_matrix(trees2, dt = 0.001)
plot(m1, type = "s", col = "red", lwd = 2, xlim = c(0, 1), ylim = c(0, 1), 
     xlab = "Normalized Time", ylab = "Normalized number of lineages")
lines(m2, type = "s", col = "blue", lwd = 2)
legend("topleft", c("trees1", "trees2"), col = c("red", "blue"), 
       lty = 1, lwd = 2)

## ------------------------------------------------------------------------
 treesim <- function(params) {
    t <- TESS::tess.sim.taxa(n = 1,
                             lambda = params[1],
                             mu = 0.0, nTaxa = 100, max = 10)[[1]]
    return(t)
 }

## ------------------------------------------------------------------------
  prior_gen <- function() {
    rexp(n = 1, rate = 10)
  }

  prior_dens <- function(val) {
    dexp(val[1], rate = 10)
  }
  
  statwrapper <- function(tree1) {
    nLTTstat_exact(tree1, obs, "abs")  #nolint
  }

## ------------------------------------------------------------------------
set.seed(42)
obs <- treesim(c(0.50, 0)) #lambda = 0.5, mu = 0.0

## ------------------------------------------------------------------------
A <- abc_smc_nltt(
    obs, c(statwrapper), treesim, init_epsilon_values = 0.2,
    prior_generating_function = prior_gen,
    prior_density_function = prior_dens,
    number_of_particles = 100, sigma = 0.05, stop_rate = 0.01)

## ------------------------------------------------------------------------
hist(A, breaks = seq(0, 1, by = 0.05), col = "grey", main = "Lambda")
abline(v = 0.5, lty = 2, col = "blue", lwd = 2)

## ------------------------------------------------------------------------
LL_B <- function(params, phy) {
    lnl <- TESS::tess.likelihood(ape::branching.times(phy),
                                 lambda = params[1], mu = 0.0,
                                 samplingProbability = 1, log = TRUE)
    prior1  <- log(prior_dens(params)) # nolint
    return(lnl + prior1)
}

## ------------------------------------------------------------------------
  fun <- function(x) {
    return(-1 * LL_B(x, obs)) # nolint
  }
  ML <- stats::optimize(f = fun, interval = c(0, 1))
  ML
  hist(A, breaks = seq(0, 1, by = 0.05), col = "grey", main = "Lambda")
  abline(v = 0.5, lty = 2, col = "blue", lwd = 2)
  abline(v = ML$minimum, lty = 2, col = "green", lwd = 2)
  legend("topright", c("ABC-SMC", "ML", "True"),
         pch = c(15, NA, NA),
         lty = c(NA, 2, 2), 
         col = c("grey", "green", "blue"), lwd = 2)

## ------------------------------------------------------------------------
B <- mcmc_nltt(obs, LL_B, parameters = c(0.5), 
                         logtransforms = c(TRUE),
                         iterations = 10000, burnin = 1000,
                         thinning = 1, sigma = 1)

## ------------------------------------------------------------------------
B.mcmc <- coda::as.mcmc(B)
plot(B.mcmc)

## ------------------------------------------------------------------------
  par(mfrow = c(1, 2))
  hist(A, breaks = seq(0, 1, by = 0.05), col = "grey", 
       main = "Lambda, ABC", xlab = "")
  abline(v = 0.5, lty = 2, col = "blue", lwd = 2)
  abline(v = ML$minimum, lty = 2, col = "green", lwd = 2)
  legend("right", c("ML", "True"),
         lty = c(2, 2), 
         col = c("green", "blue"), lwd = 2)
  hist(B, breaks = seq(0, 1, by = 0.05), col = "grey", 
       main = "Lambda, MCMC", xlab = "")
  abline(v = 0.5, lty = 2, col = "blue", lwd = 2)
  abline(v = ML$minimum, lty = 2, col = "green", lwd = 2)

