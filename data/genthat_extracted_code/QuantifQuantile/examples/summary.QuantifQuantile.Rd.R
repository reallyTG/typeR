library(QuantifQuantile)


### Name: summary.QuantifQuantile
### Title: Summary of QuantifQuantile results
### Aliases: summary.QuantifQuantile

### ** Examples

set.seed(644972)
n <- 300
X <- runif(300,-2,2)
Y <- X^2+rnorm(n)
res <- QuantifQuantile(X,Y,testN=seq(10,25,by=5))
summary(res)



