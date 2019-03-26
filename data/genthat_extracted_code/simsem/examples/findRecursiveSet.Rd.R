library(simsem)


### Name: findRecursiveSet
### Title: Group variables regarding the position in mediation chain
### Aliases: findRecursiveSet

### ** Examples

path <- matrix(0, 9, 9)
path[4, 1] <- path[7, 4] <- NA
path[5, 2] <- path[8, 5] <- NA
path[6, 3] <- path[9, 6] <- NA
path[5, 1] <- path[8, 4] <- NA
path[6, 2] <- path[9, 5] <- NA
findRecursiveSet(path)



