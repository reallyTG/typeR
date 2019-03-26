library(speedglm)


### Name: add1.speedlm
### Title: Wrappers to the add1 and drop1 methods for speedlm and speedglm
###   objects
### Aliases: add1.speedlm drop1.speedlm extractAIC.speedlm nobs.speedlm
###   add1.speedglm drop1.speedglm extractAIC.speedglm nobs.speedglm

### ** Examples

## Not run: 
##D set.seed(10)
##D n <- 1000
##D k <- 3
##D x <- round(matrix(rnorm(n * k), n, k), digits = 3)
##D beta <- c(0.05,0.5,0.8,1.3,1.8)
##D y <- drop(tcrossprod(cbind(1,x,x[,2]*x[,3]),t(beta))) + rnorm(n,,0.2)
##D colnames(x) <- c("s1", "s2", "s3") 
##D da <- data.frame(y, x)
##D 
##D m0 <- speedlm(y ~ 1, data = da,model=TRUE, y=TRUE)
##D m0.1 <- add1(m0,scope=~(s1+s2+s3)^2, data = da)
##D m1 <- step(m0,scope=~(s1+s2+s3)^3)
##D m1
##D 
##D m2 <- speedglm(y ~ 1, data = da, model=TRUE, y=TRUE)
##D m2.1 <- add1(m2,scope=~(s1+s2+s3)^2, data = da)
##D m3 <- step(m2,scope=~(s1+s2+s3)^3)
##D m3
## End(Not run)



