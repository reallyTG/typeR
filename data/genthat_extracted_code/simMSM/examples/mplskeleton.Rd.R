library(simMSM)


### Name: mplskeleton
### Title: Build Up a Model Parameter List Skeleton
### Aliases: mplskeleton

### ** Examples

## Two state-type model with transient state-types 1 and 2: 
tra2 <- matrix(ncol = 2, nrow = 2, data = FALSE)
tra2[1, 2] <- tra2[2, 1] <- TRUE
mplskeleton(tmat = tra2)
## Illness-death model (IDM) with recovery:
traIDM <- matrix(nrow = 3, ncol = 3, FALSE)
traIDM[1, 2] <- traIDM[1, 3] <- traIDM[2, 1] <- traIDM[2, 3] <- TRUE
mplskeleton(tmat = traIDM)



