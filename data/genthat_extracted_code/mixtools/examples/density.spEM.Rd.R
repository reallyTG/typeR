library(mixtools)


### Name: density.spEM
### Title: Normal kernel density estimate for semiparametric EM output
### Aliases: density.spEM
### Keywords: file

### ** Examples
 
set.seed(100)
mu <- matrix(c(0, 15), 2, 3)
sigma <- matrix(c(1, 5), 2, 3)
x <- rmvnormmix(300, lambda = c(.4,.6), mu = mu, sigma = sigma)

d <- spEM(x, mu0 = 2, blockid = rep(1,3), constbw = TRUE) 
plot(d, xlim=c(-10, 40), ylim = c(0, .16), xlab = "", breaks = 30, 
     cex.lab=1.5, cex.axis=1.5) # plot.spEM calls density.spEM here



