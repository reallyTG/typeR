library(chandwich)


### Name: plot.chandwich
### Title: Plot diagnostics a chandwich object
### Aliases: plot.chandwich

### ** Examples

# ------------------------- Binomial model, rats data ----------------------

# Contributions to the independence loglikelihood
binom_loglik <- function(prob, data) {
  if (prob < 0 || prob > 1) {
    return(-Inf)
  }
  return(dbinom(data[, "y"], data[, "n"], prob, log = TRUE))
}
rat_res <- adjust_loglik(loglik = binom_loglik, data = rats, par_names = "p")

# Vertically adjusted loglikelihood only
plot(rat_res)
# Three adjusted loglikelihoods and the independence loglikelihood
plot(rat_res, type = 1:4)
# Plot over (0,1) and reposition the legend
plot(rat_res, type = 1:4, xlim = c(0, 1), legend_pos = "bottom")



