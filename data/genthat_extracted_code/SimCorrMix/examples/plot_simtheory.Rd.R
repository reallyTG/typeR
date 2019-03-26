library(SimCorrMix)


### Name: plot_simtheory
### Title: Plot Simulated Data and Target Distribution Data by Name or
###   Function for Continuous or Count Variables
### Aliases: plot_simtheory
### Keywords: plot

### ** Examples

# Using normal mixture variable from contmixvar1 example
Nmix <- contmixvar1(n = 1000, "Polynomial", means = 0, vars = 1,
  mix_pis = c(0.4, 0.6), mix_mus = c(-2, 2), mix_sigmas = c(1, 1),
  mix_skews = c(0, 0), mix_skurts = c(0, 0), mix_fifths = c(0, 0),
  mix_sixths = c(0, 0))
plot_simtheory(Nmix$Y_mix[, 1], title = "Mixture of Normal Distributions",
  fx = function(x) 0.4 * dnorm(x, -2, 1) + 0.6 * dnorm(x, 2, 1),
  lower = -5, upper = 5)
## Not run: 
##D # Mixture of Beta(6, 3), Beta(4, 1.5), and Beta(10, 20)
##D Stcum1 <- calc_theory("Beta", c(6, 3))
##D Stcum2 <- calc_theory("Beta", c(4, 1.5))
##D Stcum3 <- calc_theory("Beta", c(10, 20))
##D mix_pis <- c(0.5, 0.2, 0.3)
##D mix_mus <- c(Stcum1[1], Stcum2[1], Stcum3[1])
##D mix_sigmas <- c(Stcum1[2], Stcum2[2], Stcum3[2])
##D mix_skews <- c(Stcum1[3], Stcum2[3], Stcum3[3])
##D mix_skurts <- c(Stcum1[4], Stcum2[4], Stcum3[4])
##D mix_fifths <- c(Stcum1[5], Stcum2[5], Stcum3[5])
##D mix_sixths <- c(Stcum1[6], Stcum2[6], Stcum3[6])
##D mix_Six <- list(seq(0.01, 10, 0.01), c(0.01, 0.02, 0.03),
##D   seq(0.01, 10, 0.01))
##D Bstcum <- calc_mixmoments(mix_pis, mix_mus, mix_sigmas, mix_skews,
##D   mix_skurts, mix_fifths, mix_sixths)
##D Bmix <- contmixvar1(n = 10000, "Polynomial", Bstcum[1], Bstcum[2]^2,
##D   mix_pis, mix_mus, mix_sigmas, mix_skews, mix_skurts, mix_fifths,
##D   mix_sixths, mix_Six)
##D plot_simtheory(Bmix$Y_mix[, 1], title = "Mixture of Beta Distributions",
##D   fx = function(x) mix_pis[1] * dbeta(x, 6, 3) + mix_pis[2] *
##D     dbeta(x, 4, 1.5) + mix_pis[3] * dbeta(x, 10, 20), lower = 0, upper = 1)
## End(Not run)




