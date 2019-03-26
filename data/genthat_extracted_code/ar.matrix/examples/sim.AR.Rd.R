library(ar.matrix)


### Name: sim.AR
### Title: Simulate correlated data from a precision matrix.
### Aliases: sim.AR

### ** Examples

require("ggplot2")

# simulate 2D ar1 process
# pairwise correlation
rho <- .95
# pairwise variance
sigma <- .5

# 2 dimensions of simulations
years <- 20
ages <- 10

# kronnecker product to get joint covariance
Q2D <- kronecker(Q.AR1(M=years, sigma, rho), Q.AR1(M=ages, sigma, rho))

# simulate the data and place it in a data frame
Q2D.df <- data.frame(obs=c(sim.AR(1, Q2D)), age=rep(1:ages, years),
                     year=rep(1:years, each=ages))

# graph results
ggplot(data=Q2D.df, aes(year, obs, group=age, color=age)) + geom_line()




