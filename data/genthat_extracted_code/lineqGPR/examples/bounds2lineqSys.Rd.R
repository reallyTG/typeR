library(lineqGPR)


### Name: bounds2lineqSys
### Title: Linear Systems of Inequalities
### Aliases: bounds2lineqSys

### ** Examples

n <- 5
A <- diag(n)
l <- rep(0, n)
u <- c(Inf, rep(1, n-1))
bounds2lineqSys(n, l, u, A, lineqSysType = "twosides")
bounds2lineqSys(n, l, u, A, lineqSysType = "oneside", rmInf = FALSE)
bounds2lineqSys(n, l, u, A, lineqSysType = "oneside", rmInf = TRUE)




