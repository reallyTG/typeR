library(QuantifQuantile)


### Name: print.QuantifQuantile
### Title: Print of QuantifQuantile results
### Aliases: print.QuantifQuantile

### ** Examples

set.seed(644972)
n <- 300
X <- runif(300,-2,2)
Y <- X^2+rnorm(n)
res <- QuantifQuantile(X,Y,testN=seq(10,25,by=5))
print(res)



