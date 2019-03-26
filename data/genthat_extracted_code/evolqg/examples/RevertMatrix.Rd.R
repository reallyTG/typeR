library(evolqg)


### Name: RevertMatrix
### Title: Revert Matrix
### Aliases: RevertMatrix

### ** Examples


## we can use RevertMatrix to represent eigentensors using SRD to compare two matrices
## which differ with respect to their projections on a single directions

data(dentus)

dentus.vcv <- daply (dentus, .(species), function(x) cov(x[,-5]))

dentus.vcv <- aperm(dentus.vcv, c(2, 3, 1))

dentus.etd <- EigenTensorDecomposition(dentus.vcv, TRUE)

## calling RevertMatrix with a single value will use this value as the score
## on the first eigentensor and use zero as the value of remaining scores

low.et1 <- RevertMatrix(-1.96, dentus.etd, TRUE)
upp.et1 <- RevertMatrix(1.96, dentus.etd, TRUE)

srd.et1 <- SRD(low.et1, upp.et1)
 
plot(srd.et1)

## we can also look at the second eigentensor, by providing each call 
## of RevertMatrix with a vector of two values, the first being zero

low.et2 <- RevertMatrix(c(0, -1.96), dentus.etd, TRUE)
upp.et2 <- RevertMatrix(c(0, 1.96), dentus.etd, TRUE)

srd.et2 <- SRD(low.et2, upp.et2)
 
plot(srd.et2)




