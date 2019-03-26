library(EMCluster)


### Name: Likelihood Mixture Tests
### Title: Likelihood Mixture Tests
### Aliases: lmt
### Keywords: programming

### ** Examples

## Not run: 
##D library(EMCluster, quietly = TRUE)
##D set.seed(1234)
##D 
##D x <- as.matrix(iris[, 1:4])
##D p <- ncol(x)
##D min.n <- p * (p + 1) / 2
##D .EMC$short.iter <- 200
##D 
##D ret.2 <- init.EM(x, nclass = 2, min.n = min.n, method = "Rnd.EM")
##D ret.3 <- init.EM(x, nclass = 3, min.n = min.n, method = "Rnd.EM")
##D ret.4 <- init.EM(x, nclass = 4, min.n = min.n, method = "Rnd.EM")
##D 
##D (lmt.23 <- lmt(ret.2, ret.3, x))
##D (lmt.34 <- lmt(ret.3, ret.4, x))
##D (lmt.24 <- lmt(ret.2, ret.4, x))
## End(Not run)



