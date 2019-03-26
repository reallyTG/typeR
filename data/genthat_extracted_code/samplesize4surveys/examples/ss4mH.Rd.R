library(samplesize4surveys)


### Name: ss4mH
### Title: The required sample size for testing a null hyphotesis for a
###   single mean
### Aliases: ss4mH

### ** Examples

ss4mH(N = 10000, mu = 500, mu0 = 505, sigma = 100)
ss4mH(N = 10000, mu = 500, mu0 = 505, sigma = 100, plot=TRUE)
ss4mH(N = 10000, mu = 500, mu0 = 505, sigma = 100, DEFF = 2, plot=TRUE)
ss4mH(N = 10000, mu = 500, mu0 = 505, sigma = 100, conf = 0.99, power = 0.9, DEFF = 2, plot=TRUE)

#############################
# Example with BigLucy data #
#############################
data(BigLucy)
attach(BigLucy)

N <- nrow(BigLucy)
mu <- mean(Income)
sigma <- sd(Income)

# The minimum sample size for testing 
# H_0: mu - mu_0 = 0   vs.   H_a: mu - mu_0 = D = 15
D = 15 
mu0 = mu - D 
ss4mH(N, mu, mu0, sigma, conf = 0.99, power = 0.9, DEFF = 2, plot=TRUE)

# The minimum sample size for testing 
# H_0: mu - mu_0 = 0   vs.   H_a: mu - mu_0 = D = 32
D = 32
mu0 = mu - D 
ss4mH(N, mu, mu0, sigma, conf = 0.99, power = 0.9, DEFF = 3.45, plot=TRUE)



