library(PwrGSD)


### Name: EX1gXK
### Title: A function for computing the bias adjusted point estimate for a
###   statistic observed to cross the efficacy boundary.
### Aliases: EX1gXK
### Keywords: Sequential Design Bias Adjusted point estimate

### ** Examples

# if Z.K = U_K/V_K^0.5 is the log-rank statistic on the standard normal
# scale, then we obtain an estimate of the logged relative risk as follows
# Suppose we've stopped at analysis number K=4, and Z.K = 2.5
# suppose the end of trial variance of the log-rank statistic
# (specified in design and used to compute 'frac') is V.end = 100

K <- 4
Z.K <- 2.5
V.end <- 100

# Information fraction
frac <- c(0.15, 0.37, 0.64, 0.76)

# Efficacy Boundary 
gsb <- GrpSeqBnds(frac=frac, EfficacyBoundary=LanDemets(spending=ObrienFleming, alpha=0.05))

# Efficacy boundary points
be <- gsb$table[,"b.e"] 

# Brownian scale
X.K <- Z.K*frac[K]

# expected value of X_1 given X_K
ex1gxk <- EX1gXK(X.K, be, frac)

# Crude estimate of logged relative risk
X.K/(frac[K]*V.end^0.5)

# Bias adjusted estimate of logged relative risk
ex1gxk/(frac[1]*V.end^0.5)



