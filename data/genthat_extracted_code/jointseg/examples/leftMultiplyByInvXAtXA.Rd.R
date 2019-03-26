library(jointseg)


### Name: leftMultiplyByInvXAtXA
### Title: leftMultiplyByInvXAtXA
### Aliases: leftMultiplyByInvXAtXA
### Keywords: internal

### ** Examples


val <- matrix(c(1.56, 1.35, 1.26, 1.15), ncol=2)
ind <- c(5,6)
n <- 10
res <- leftMultiplyByInvXAtXA(n=n, ind=ind, val=val)
res
##         [,1]      [,2]
## [1,] 1.373189 0.9630868
## [2,] 0.228796 0.3636429




