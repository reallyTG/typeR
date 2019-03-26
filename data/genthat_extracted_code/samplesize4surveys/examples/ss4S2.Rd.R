library(samplesize4surveys)


### Name: ss4S2
### Title: The required sample size for estimating a single variance
### Aliases: ss4S2

### ** Examples

ss4S2(N = 10000, K = 0, cve = 0.05, me = 0.03)
ss4S2(N = 10000, K = 1, cve = 0.05, me = 0.03)
ss4S2(N = 10000, K = 1, cve = 0.05, me = 0.05, DEFF = 2)
ss4S2(N = 10000, K = 1, cve = 0.05, me = 0.03, plot = TRUE)

#############################
# Example with BigLucy data #
#############################

data(BigLucy)
attach(BigLucy)
N <- nrow(BigLucy)
K <- kurtosis(BigLucy$Income)
# The minimum sample size for simple random sampling
ss4S2(N, K, DEFF=1, conf=0.99, cve=0.03, me=0.1, plot=TRUE)
# The minimum sample size for a complex sampling design
ss4S2(N, K, DEFF=3.45, conf=0.99, cve=0.03, me=0.1, plot=TRUE)



