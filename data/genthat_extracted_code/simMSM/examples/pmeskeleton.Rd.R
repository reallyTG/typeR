library(simMSM)


### Name: pmeskeleton
### Title: Build Up a Partial Markov Model Linear Predictor List Skeleton
### Aliases: pmeskeleton

### ** Examples

## Two state-type model with transient state-types 1 and 2: 
tra2 <- matrix(ncol = 2, nrow = 2, data = FALSE)
tra2[1, 2] <- tra2[2, 1] <- TRUE
pmeskeleton(tmat = tra2)
## Illness-death model (IDM) with recovery:
traIDM <- matrix(nrow = 3, ncol = 3, FALSE)
traIDM[1, 2] <- traIDM[1, 3] <- traIDM[2, 1] <- traIDM[2, 3] <- TRUE
pmeskeleton(tmat = traIDM)



