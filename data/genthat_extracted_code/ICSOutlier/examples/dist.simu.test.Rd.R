library(ICSOutlier)


### Name: dist.simu.test
### Title: Cut-Off Values Using Simulations for the Detection of Extreme
###   ICS Distances
### Aliases: dist.simu.test
### Keywords: multivariate

### ** Examples

# For a real analysis use larger values for m and more cores if available

Z <- rmvnorm(1000, rep(0, 6))
Z[1:20, 1] <- Z[1:20, 1] + 10
A <- matrix(rnorm(36), ncol = 6)
X <- tcrossprod(Z, A)

pairs(X)
icsX <- ics2(X)

icsX.dist.1 <- ics.distances(icsX, index = 1)
CutOff <- dist.simu.test(icsX, 1, m = 500, ncores = 1)

# check if outliers are above the cut-off value
plot(icsX.dist.1, col = rep(2:1, c(20, 980)))
abline(h = CutOff)


library(REPPlab)
data(ReliabilityData)
# The observations 414 and 512 are suspected to be outliers
icsReliability <- ics2(ReliabilityData, S1 = MeanCov, S2 = Mean3Cov4)
# Choice of the number of components with the screeplot: 2
screeplot(icsReliability)
# Computation of the distances with the first 2 components
ics.dist.scree <- ics.distances(icsReliability, index = 1:2)
# Computation of the cut-off of the distances 
CutOff <- dist.simu.test(icsReliability, 1:2, m = 50, level = 0.02, ncores = 1)
# Identification of the outliers based on the cut-off value
plot(ics.dist.scree)
abline(h = CutOff)
outliers <- which(ics.dist.scree >= CutOff)
text(outliers, ics.dist.scree[outliers], outliers, pos = 2, cex = 0.9)

## Not run: 
##D # For using three cores
##D # For demo purpose only small m value, should select the first component
##D dist.simu.test(icsReliability, 1:2, m = 500, level = 0.02, ncores = 3, iseed = 123)
##D   
##D # For using several cores and for using a scatter function from a different package
##D # Using the parallel package to detect automatically the number of cores
##D library(parallel)
##D # ICS with Multivariate Median and Tyler's Shape Matrix and the usual estimates
##D library(ICSNP)
##D icsReliabilityHRMest <- ics2(ReliabilityData, S1 = HR.Mest, S2 = MeanCov, 
##D                              S1args = list(maxiter = 1000))
##D # Computation of the cut-off of the distances. For demo purpose only small m value.
##D dist.simu.test(icsReliabilityHRMest,  1:2, m = 500, level = 0.02, ncores = detectCores()-1, 
##D                pkg = c("ICSOutlier","ICSNP"), iseed = 123)
## End(Not run)



