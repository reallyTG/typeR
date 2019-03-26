library(mvPot)


### Name: mvtNormQuasiMonteCarlo
### Title: Multivariate normal distribution function
### Aliases: mvtNormQuasiMonteCarlo

### ** Examples


#Define locations
loc <- expand.grid(1:4, 1:4)
ref <- sample.int(16, 1)

#Compute variogram matrix
variogramMatrix <- ((sqrt((outer(loc[,1],loc[,1],"-"))^2 +
(outer(loc[,2],loc[,2],"-"))^2)) / 2)^(1.5)

#Define an upper boud
upperBound <- variogramMatrix[-ref,ref]

#Compute covariance matrix
cov <-  (variogramMatrix[-ref,ref]%*%t(matrix(1, (nrow(loc) - 1), 1)) +
t(variogramMatrix[ref,-ref]%*%t(matrix(1, (nrow(loc) - 1), 1))) -
variogramMatrix[-ref,-ref])

#Compute generating vector
p <- 499
latticeRule <- genVecQMC(p, (nrow(loc) - 1))

#Estimate the multivariate distribution function
mvtNormQuasiMonteCarlo(latticeRule$primeP, upperBound, cov, latticeRule$genVec)



