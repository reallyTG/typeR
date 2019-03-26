library(PSCBS)


### Name: as.DNAcopy.CBS
### Title: Coerces a CBS object to a DNAcopy object
### Aliases: as.DNAcopy.CBS CBS.as.DNAcopy as.DNAcopy,CBS-method
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


 
# Coerce an CBS object to a DNAcopy object
fitD <- as.DNAcopy(fit)

# Coerce an DNAcopy object to a CBS object
fitC <- as.CBS(fitD)

# Sanity check
fitD2 <- as.DNAcopy(fit)
stopifnot(all.equal(fitD2, fitD))

fitC2 <- as.CBS(fitD2)
stopifnot(all.equal(fitC2, fitC))




