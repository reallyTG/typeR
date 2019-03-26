library(Renext)


### Name: fgamma
### Title: ML estimation of the Gamma distribution
### Aliases: fgamma

### ** Examples

set.seed(9876)
alpha <- 0.06
beta <- rexp(1)
n <- 30
x <- rgamma(n, shape = alpha, scale = beta)
fit <- fgamma(x, check.loglik = TRUE)

## compare with MASS results
if (require(MASS)) {
   fit.MASS <- fitdistr(x, densfun = "gamma")
   rate <- 1 / fit$estimate["scale"]
   est <- c(fit$estimate, rate = rate)
   der <- rate * rate ## derivative of rate w.r.t scale
   sdest <- c(fit$sd, rate = der * fit$sd["scale"])
   tab <- rbind(sprintf(" %10.8f ", est),
                sprintf("(%10.8f)", sdest))
   colnames(tab) <- c("shape", "scale", "rate")
   rownames(tab) <- c("est", "sd")
   noquote(tab)
}




