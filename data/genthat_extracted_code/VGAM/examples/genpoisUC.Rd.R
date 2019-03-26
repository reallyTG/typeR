library(VGAM)


### Name: dgenpois
### Title: The Generalized Poisson Distribution
### Aliases: dgenpois
### Keywords: distribution

### ** Examples

sum(dgenpois(0:1000, lambda = -0.5, theta = 2))  # Not perfect...
## Not run: 
##D lambda <- -0.2; theta <- 2; y <- 0:10
##D proby <- dgenpois(y, lambda = lambda, theta = theta, log = FALSE)
##D plot(y, proby, type = "h", col = "blue", lwd = 2, ylab = "P[Y=y]",
##D      main = paste("Y ~ Generalized Poisson(lambda=", lambda,
##D                   ", theta=", theta, ")", sep = ""), las = 1,
##D      sub = "Orange is the Poisson probability function")
##D sum(proby)
##D lines(y + 0.1, dpois(y, theta), type = "h", lwd = 2, col = "orange")
## End(Not run)



