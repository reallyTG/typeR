library(bigKRLS)


### Name: shiny.bigKRLS
### Title: shiny.bigKRLS
### Aliases: shiny.bigKRLS

### ** Examples

# N <- 500  # proceed with caution above N = 5,000 for system with 8 gigs made avaiable to R
# P <- 4
# X <- matrix(rnorm(N*P), ncol=P)
# b <- 1:P 
# y <- sin(X[,1]) + X %*% b + rnorm(N)
# out <- bigKRLS(y, X, Ncores=1)
# shiny.bigKRLS(out, "exciting_results", "The Results", c("Frequency", "xA", "xB", "xC")) # not run



