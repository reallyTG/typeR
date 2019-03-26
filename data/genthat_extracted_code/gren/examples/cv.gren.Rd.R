library(gren)


### Name: cv.gren
### Title: Performance cross-validation of group-regularized logistic
###   elastic net regression
### Aliases: cv.gren

### ** Examples

## No test: 
## Create data
p <- 1000
n <- 100
set.seed(2018)
x <- matrix(rnorm(n*p), ncol=p, nrow=n)
beta <- c(rnorm(p/2, 0, 0.1), rnorm(p/2, 0, 1))
m <- rep(1, n)
y <- rbinom(n, m, as.numeric(1/(1 + exp(-x %*% as.matrix(beta)))))
partitions <- list(groups=rep(c(1, 2), each=p/2))

## calculate cross-validated predictions and performance measures
fit.cv.gren <- cv.gren(x, y, m, partitions=partitions, fix.lambda=TRUE)
## End(No test)



