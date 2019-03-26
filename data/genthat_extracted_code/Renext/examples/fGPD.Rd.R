library(Renext)


### Name: fGPD
### Title: Fit a two-parameters Generalised Pareto Distribution from a
###   sample
### Aliases: fGPD

### ** Examples

## Not run: 
##D set.seed(123456)
##D n <- 500
##D ns <- 1000
##D xi <- runif(ns, min = -0.5, max = 0.5)
##D X <- matrix(nrow = n, ncol = ns)
##D 
##D for (i in 1:length(xi)) {
##D   Xi <- rgpd(n, scale = 1, shape = xi[i])
##D   X[ , i] <- Xi
##D   res1 <- fGPD(Xi)
##D   res2 <- try(fpot(Xi, threshold = 0.0))
##D   if (inherits(res2, "try-error")) {
##D     cat(res2, "\n")
##D     break
##D   }
##D   logLik1 <- res1$loglik; logLik2 <- logLik(res2)
##D   if (abs(logLik1 - logLik2) > 0.001) {
##D     cat(sprintf("i = %d, xi = %7.4f\n", i, xi[i]))
##D     mat <- rbind(c(res1$estimate[1:2], logLik = logLik1),
##D                  c(res2$estimate[1:2], logLik = logLik2))
##D     rownames(mat) <- c("fGPD", "fpot")
##D     print(mat)
##D   }
##D }
## End(Not run)



