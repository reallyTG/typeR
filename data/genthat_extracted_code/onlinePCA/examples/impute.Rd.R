library(onlinePCA)


### Name: impute
### Title: BLUP Imputation of Missing Values
### Aliases: impute

### ** Examples

set.seed(10)
lambda <- c(1,2,5)
U <- qr.Q(qr(matrix(rnorm(30),10,3)))
x <- U %*% diag(sqrt(lambda)) %*% rnorm(3) + rnorm(10, sd =.05)
x.na <- x
x.na[c(1,3,7)] <- NA
x.imputed <- impute(lambda,U,x.na)
cbind(x,x.imputed)



