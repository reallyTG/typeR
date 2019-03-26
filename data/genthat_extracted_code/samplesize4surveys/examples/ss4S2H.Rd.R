library(samplesize4surveys)


### Name: ss4S2H
### Title: The required sample size for testing a null hyphotesis for a
###   single variance
### Aliases: ss4S2H

### ** Examples


ss4S2H(N = 10000, S2 = 120, S20 = 110, K = 0)
ss4S2H(N = 10000, S2 = 120, S20 = 110, K = 2, DEFF = 2, power = 0.9)
ss4S2H(N = 10000, S2 = 120, S20 = 110, K = 2, DEFF = 2, power = 0.8, plot = TRUE)

#############################
# Example with BigLucy data #
#############################
data(BigLucy)
attach(BigLucy)
N <- nrow(BigLucy)
S2 <- var(BigLucy$Income)

# The minimum sample size for testing 
# H_0: S2 - S2_0 = 0   vs.   H_a: S2 - S2_0 = D = 8000
D = 8000 
S20 = S2 - D 
K <- kurtosis(BigLucy$Income)
ss4S2H(N, S2, S20, K, DEFF=1, conf = 0.99, power = 0.8, plot=TRUE)



