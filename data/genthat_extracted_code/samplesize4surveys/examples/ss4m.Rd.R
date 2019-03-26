library(samplesize4surveys)


### Name: ss4m
### Title: The required sample size for estimating a single mean
### Aliases: ss4m

### ** Examples

ss4m(N=10000, mu=10, sigma=2, cve=0.05, rme=0.05)
ss4m(N=10000, mu=10, sigma=2, cve=0.05, rme=0.03, plot=TRUE)
ss4m(N=10000, mu=10, sigma=2, DEFF=3.45, cve=0.05, rme=0.03, plot=TRUE)

##########################
# Example with Lucy data #
##########################

data(Lucy)
attach(Lucy)
N <- nrow(Lucy)
mu <- mean(Income)
sigma <- sd(Income)
# The minimum sample size for simple random sampling
ss4m(N, mu, sigma, DEFF=1, conf=0.95, cve=0.03, rme=0.03, plot=TRUE)
# The minimum sample size for a complex sampling design
ss4m(N, mu, sigma, DEFF=3.45, conf=0.95, cve=0.03, rme=0.03, plot=TRUE)



