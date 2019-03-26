library(psychotree)


### Name: DIFSim
### Title: Artificial Data with Differential Item Functioning
### Aliases: DIFSim DIFSimPC
### Keywords: datasets

### ** Examples

## data
data("DIFSim", package = "psychotree")
data("DIFSimPC", package = "psychotree")

## summary of covariates
summary(DIFSim[, -1])
summary(DIFSimPC[, -1])

## empirical frequencies of responses
plot(DIFSim$resp)
plot(DIFSimPC$resp)

## histogram of raw scores
hist(rowSums(DIFSim$resp), breaks = 0:20 - 0.5)
hist(rowSums(DIFSimPC$resp), breaks = 0:17 - 0.5)



