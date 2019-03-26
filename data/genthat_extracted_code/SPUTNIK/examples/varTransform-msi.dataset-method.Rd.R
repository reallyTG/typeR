library(SPUTNIK)


### Name: varTransform,msi.dataset-method
### Title: Variance stabilizing transformation.
### Aliases: varTransform,msi.dataset-method varTransform

### ** Examples

## Load package
library("SPUTNIK")

## Create the msi.dataset-class object
sz <- c(5, 4)
x <- matrix(rnorm(sz[1] * sz[2] * 20), sz[1]*sz[2], 20)
x[x < 0] <- 0 # MS data is positive
mz <- sort(sample(100, ncol(x)))
msiX <- msiDataset(x, mz, sz[1], sz[2])

## Normalize and log-transform
msiX <- normIntensity(msiX, "median")
msiX <- varTransform(msiX, "log")

## Create the msi.dataset-class object
sz <- c(5, 4)
x <- matrix(rnorm(sz[1] * sz[2]), sz[1]*sz[2], 20)
x[x < 0] <- 0 # MS data is positive
mz <- sort(sample(100, ncol(x)))
msiX <- msiDataset(x, mz, sz[1], sz[2])

## Normalize using PQN
msiX <- normIntensity(msiX, "PQN")



