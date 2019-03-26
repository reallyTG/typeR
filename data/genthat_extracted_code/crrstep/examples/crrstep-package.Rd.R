library(crrstep)


### Name: crrstep-package
### Title: Stepwise regression procedure for the Fine & Gray regression
###   model in competing risks
### Aliases: crrstep-package

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
formula1 <- ftime ~ 1 + x1 + x2 + x3 + x4 + x5 + as.factor(x6) + as.factor(x7) 

crrstep(formula1, , fstatus, data = as.data.frame(cov1), direction = "backward", criterion = "BIC")
crrstep(formula1, , fstatus, data = as.data.frame(cov1), direction = "backward", criterion = "AIC")

ans2 <- crrstep(formula1, , fstatus, data = as.data.frame(cov1), direction = "forward", 
		failcode=2, criterion = "AIC")
ans2



