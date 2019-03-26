library(PSCBS)


### Name: pruneBySdUndo.CBS
### Title: Prune the CBS profile by dropping change points that are too
###   small
### Aliases: pruneBySdUndo.CBS CBS.pruneBySdUndo pruneBySdUndo,CBS-method
### Keywords: internal methods

### ** Examples


# - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
# Simulating copy-number data
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
set.seed(0xBEEF)

# Number of loci
J <- 1000

mu <- double(J)
mu[1:100] <- mu[1:100] + 0.3
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
# Post-segmentation pruning
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
fitP <- pruneBySdUndo(fit, rho=1)
drawLevels(fitP, col="red")



