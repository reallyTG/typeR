library(mclust)


### Name: cross
### Title: Simulated Cross Data
### Aliases: cross
### Keywords: datasets

### ** Examples

# This dataset was created as follows
## Not run: 
##D n <- 250 
##D set.seed(0)
##D cross <- rbind(matrix(rnorm(n*2), n, 2) %*% diag(c(1,9)),
##D                matrix(rnorm(n*2), n, 2) %*% diag(c(1,9))[,2:1])
##D cross <- cbind(c(rep(1,n),rep(2,n)), cross)
## End(Not run)



