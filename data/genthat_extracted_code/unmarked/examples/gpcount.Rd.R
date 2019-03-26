library(unmarked)


### Name: gpcount
### Title: Generalized binomial N-mixture model for repeated count data
### Aliases: gpcount

### ** Examples

set.seed(54)

nSites <- 20
nVisits <- 4
nReps <- 3

lambda <- 5
phi <- 0.7
p <- 0.5

M <- rpois(nSites, lambda) # super-population size

N <- matrix(NA, nSites, nVisits)
y <- array(NA, c(nSites, nReps, nVisits))
for(i in 1:nVisits) {
    N[,i] <- rbinom(nSites, M, phi) # population available during vist j
}
colMeans(N)

for(i in 1:nSites) {
    for(j in 1:nVisits) {
        y[i,,j] <- rbinom(nReps, N[i,j], p)
    }
}

ym <- matrix(y, nSites)
ym[1,] <- NA
ym[2, 1:nReps] <- NA
ym[3, (nReps+1):(nReps+nReps)] <- NA
umf <- unmarkedFrameGPC(y=ym, numPrimary=nVisits)

## Not run: 
##D fmu <- gpcount(~1, ~1, ~1, umf, K=40, control=list(trace=TRUE, REPORT=1))
##D 
##D backTransform(fmu, type="lambda")
##D backTransform(fmu, type="phi")
##D backTransform(fmu, type="det")
## End(Not run)




