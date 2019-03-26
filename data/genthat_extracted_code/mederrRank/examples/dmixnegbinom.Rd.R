library(mederrRank)


### Name: dmixnegbinom
### Title: The Negative Binomial Mixture Distribution
### Aliases: dmixnegbinom
### Keywords: Counts DuMocuhel Medication Errors Mixture Negative Binomial
###   Distribution

### ** Examples

## Not run: 
##D data("simdata", package = "mederrRank")
##D ni <- simdata@numi
##D theta0 <- c(10, 6, 100, 100, .1)
##D ans <- mixnegbinom.em(simdata, theta0, 50000, 0.01,
##D 	se = FALSE, stratified = TRUE)
##D theta <- ans$theta.hat
##D N.E <- cbind(ans$N[1:ni], ans$E[1:ni])[sort(ans$N[1:ni], index.return = TRUE)$ix, ]
##D N.ix <- match(unique(N.E[, 1]), N.E[, 1])
##D N <- N.E[N.ix, 1]
##D E <- N.E[N.ix, 2]
##D dens <- dmixnegbinom(N, theta, E)
##D hist(N.E[, 1], breaks = 40, freq = FALSE)
##D points(N, dens)
## End(Not run)



