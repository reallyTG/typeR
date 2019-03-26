library(VGAM)


### Name: mix2poisson
### Title: Mixture of Two Poisson Distributions
### Aliases: mix2poisson
### Keywords: models regression

### ** Examples

## Not run: 
##D  # Example 1: simulated data
##D nn <- 1000
##D mu1 <- exp(2.5)  # Also known as lambda1
##D mu2 <- exp(3)
##D (phi <- logit(-0.5, inverse = TRUE))
##D mdata <- data.frame(y = rpois(nn, ifelse(runif(nn) < phi, mu1, mu2)))
##D mfit <- vglm(y ~ 1, mix2poisson, data = mdata)
##D coef(mfit, matrix = TRUE)
##D 
##D # Compare the results with the truth
##D round(rbind('Estimated' = Coef(mfit), 'Truth' = c(phi, mu1, mu2)), digits = 2)
##D 
##D ty <- with(mdata, table(y))
##D plot(names(ty), ty, type = "h", main = "Orange=estimate, blue=truth",
##D      ylab = "Frequency", xlab = "y")
##D abline(v = Coef(mfit)[-1], lty = 2, col = "orange", lwd = 2)
##D abline(v = c(mu1, mu2), lty = 2, col = "blue", lwd = 2)
##D 
##D # Example 2: London Times data (Lange, 1997, p.31)
##D ltdata1 <- data.frame(deaths = 0:9,
##D                       freq = c(162, 267, 271, 185, 111, 61, 27, 8, 3, 1))
##D ltdata2 <- data.frame(y = with(ltdata1, rep(deaths, freq)))
##D 
##D # Usually this does not work well unless nsimEIM is large
##D Mfit <- vglm(deaths ~ 1, weight = freq, data = ltdata1,
##D             mix2poisson(iphi = 0.3, il1 = 1, il2 = 2.5, nsimEIM = 5000))
##D 
##D # This works better in general
##D Mfit <- vglm(y ~ 1, mix2poisson(iphi = 0.3, il1 = 1, il2 = 2.5), data = ltdata2)
##D coef(Mfit, matrix = TRUE)
##D Coef(Mfit)
## End(Not run)



