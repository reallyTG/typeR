library(mixtools)


### Name: spEM
### Title: Semiparametric EM-like Algorithm for Mixtures of Independent
###   Repeated Measurements
### Aliases: spEM
### Keywords: file

### ** Examples
## Not run: 
##D ## simulate a 2-component gaussian mixture with 3 iid repeated measures
##D set.seed(100)
##D mu <- matrix(c(0, 15), 2, 3)
##D sigma <- matrix(c(1, 5), 2, 3)
##D x <- rmvnormmix(300, lambda = c(.4,.6), mu = mu, sigma = sigma)
##D 
##D ## apply spEM with or without an iterative bandwidth selection
##D d <- spEM(x, mu0 = 2, blockid = rep(1,3), constbw = FALSE)
##D d2 <- spEM(x, mu0 = 2, blockid = rep(1,3), constbw = TRUE)
##D plot(d, xlim=c(-10, 40), ylim = c(0, .16), xlab = "", breaks = 30,
##D      cex.lab=1.5, cex.axis=1.5, addlegend=FALSE)
##D plot(d2, newplot=FALSE, addlegend=FALSE, lty=2)
## End(Not run)



