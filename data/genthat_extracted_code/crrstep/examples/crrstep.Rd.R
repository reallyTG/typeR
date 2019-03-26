library(crrstep)


### Name: crrstep
### Title: Stepwise regression for competing risks regression
### Aliases: crrstep
### Keywords: stepwise competing risks

### ** Examples

set.seed(123)
n <- 500
ftime <- rexp(n)
fstatus <- sample(0:2,n,replace=TRUE)
cov1 <- matrix(runif(5*n),nrow=n)
x61 <- as.factor(sample(3, size=n, rep=TRUE))
x71 <- as.factor(sample(5, size=n, rep = TRUE))
cov1 <- cbind(cov1, x61, x71)
dimnames(cov1)[[2]] <- c('x1','x2','x3','x4','x5', 'x6', 'x7')
formula1 <- ftime ~ x1 + x2 + x3 + x4 + x5 + as.factor(x6) + as.factor(x7) 

crrstep(formula1, , fstatus, data = as.data.frame(cov1), direction = "backward", criterion = "BIC")

ans2 <- crrstep(formula1, , fstatus, data = as.data.frame(cov1), direction = "forward", 
		failcode=2, criterion = "AIC")
ans2




