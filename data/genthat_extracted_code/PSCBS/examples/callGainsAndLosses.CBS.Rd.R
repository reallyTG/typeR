library(PSCBS)


### Name: callGainsAndLosses.CBS
### Title: Calls gains and losses
### Aliases: callGainsAndLosses.CBS CBS.callGainsAndLosses
###   callGainsAndLosses,CBS-method
### Keywords: internal methods

### ** Examples

 
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
# Simulating copy-number data
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
set.seed(0xBEEF)

# Number of loci
J <- 1000

mu <- double(J)
mu[200:300] <- mu[200:300] + 1
mu[350:400] <- NA # centromere
mu[650:800] <- mu[650:800] - 1
eps <- rnorm(J, sd=1/2)
y <- mu + eps
x <- sort(runif(length(y), max=length(y))) * 1e5
w <- runif(J)
w[650:800] <- 0.001


# - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
# Segmentation
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
fit <- segmentByCBS(y, x=x)
print(fit)
plotTracks(fit)


 
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
# CALLS
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
# Call gains and losses by segments
fitC <- callGainsAndLosses(fit)

# Call amplifications by segments
fitC <- callAmplifications(fitC)

# Call outliers by loci
fitC <- callOutliers(fitC)




