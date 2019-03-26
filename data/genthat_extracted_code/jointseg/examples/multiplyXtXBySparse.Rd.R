library(jointseg)


### Name: multiplyXtXBySparse
### Title: multiplyXtXBySparse
### Aliases: multiplyXtXBySparse
### Keywords: internal

### ** Examples


val <- matrix(c(1.56, 1.35, 1.26, 1.15), ncol=2)
ind <- c(5,6)
n <- 10
res <- multiplyXtXBySparse(n=n, ind=ind, val=val)
res
##           [,1]      [,2]
## [1,] 0.8874235 0.7329904
## [2,] 1.3311352 1.0994855
## [3,] 1.7428651 1.4395645
## [4,] 2.1737347 1.7954524
## [5,] 2.6622704 2.1989711
## [6,] 2.6237347 2.1787857
## [7,] 2.1036678 1.7469149
## [8,] 1.6067028 1.3342283
## [9,] 1.0711352 0.8894855




