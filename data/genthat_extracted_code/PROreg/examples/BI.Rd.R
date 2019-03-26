library(PROreg)


### Name: BI
### Title: The Binomial distribution with optional Dispersion Parameter
### Aliases: dBI rBI
### Keywords: stats

### ** Examples

k <- 1000
m <- 10
p <- 0.765
phi <- 4.35

#simulating
y <- rBI(k,m,p,phi)
y

#density function
d <- dBI(m,p,phi)
d

#plot the simulated variable and fit the density
hist(y,col="lightgrey")
lines(seq(0,m),k*d,col="blue",lwd=2)



