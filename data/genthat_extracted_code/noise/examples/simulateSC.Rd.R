library(noise)


### Name: simulateSC
### Title: Simulate single-cell expression levels of two reporters
### Aliases: simulateSC

### ** Examples

# simulation #1

# simulate 500 data sets
n.simu <- 500

# true intrinsic and extrinsic noise
int.true <- 0.7
ext.true <- 0.8

# create matrices to hold estimated intrinsic and extrinsic noise
# using different estimators
int.simu.mtx <- matrix (0, nrow=n.simu, ncol=8)
ext.simu.mtx <- matrix (0, nrow=n.simu, ncol=4)

for (i in 1:n.simu) {
    n <- 1000
    simu <- simulateSC (n=n, intrinsic=int.true, extrinsic=ext.true, mean=1)
    
    int.simu.mtx[i,] <- c(unlist (computeIntrinsicNoise (simu[,1], simu[,2])), 
        cor (simu[,1], simu[,2]))
    ext.simu.mtx[i,] <- unlist (computeExtrinsicNoise (simu[,1], simu[,2]))
    
}

# add column names to simulation estimates
colnames (int.simu.mtx) <- c("ELSS", "unbiasedGeneral", "unbiasedEqualMean", 
    "minMSEGeneral", "minMSEEqualMean", "asymptoticGeneral", 
    "asymptoticEqualMean", "cor")
colnames (ext.simu.mtx) <- c("ELSS", "unbiased", "minMSE", "asymptotic")


# simulation #2

# simulate 500 data sets
n.simu <- 500

# true intrinsic and extrinsic noise
int.true <- 0.7
ext.true <- 0.8

# use true correlation for the min-MSE estimates of extrinsic noise
true.cor <- ext.true / (ext.true + int.true)

# create matrices to hold estimated intrinsic and extrinsic noise
# using different estimators
int.simu.mtx <- matrix (0, nrow=n.simu, ncol=8)
ext.simu.mtx <- matrix (0, nrow=n.simu, ncol=4)
ext.simu.mtx.2 <- matrix (0, nrow=n.simu, ncol=4)

for (i in 1:n.simu) {
    n <- 50
    simu <- simulateSC (n=n, intrinsic=int.true, extrinsic=ext.true, mean=1)
    
    int.simu.mtx[i,] <- c(unlist (computeIntrinsicNoise (simu[,1], simu[,2])), 
      cor (simu[,1], simu[,2]))
    ext.simu.mtx[i,] <- unlist (computeExtrinsicNoise (simu[,1], simu[,2]))
    ext.simu.mtx.2[i,] <- c(unlist (computeExtrinsicNoiseKnownCor (simu[,1], 
      simu[,2], true.cor)))
}

# add column names to simulation estimates
colnames (int.simu.mtx) <- c("ELSS", "unbiasedGeneral", "unbiasedEqualMean", 
    "minMSEGeneral", "minMSEEqualMean", "asymptoticGeneral", 
    "asymptoticEqualMean", "cor")
colnames (ext.simu.mtx) <- c("ELSS", "unbiased", "minMSE", "asymptotic")
colnames (ext.simu.mtx.2) <- c("ELSS", "unbiased", "minMSE", "asymptotic")

# compute the MSE of estimates
computeMSE <- function (a, t) {return (mean((a-t)^2))}
apply (int.simu.mtx[,1:7], 2, computeMSE, t=int.true)
apply (ext.simu.mtx, 2, computeMSE, t=ext.true)
apply (ext.simu.mtx.2, 2, computeMSE, t=ext.true)




