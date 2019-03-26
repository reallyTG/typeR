library(NPsimex)


### Name: lambda.select
### Title: A rule of thumb lambda_1 selection in density estimation with
###   SIMEX
### Aliases: lambda.select
### Keywords: smoothing

### ** Examples


N <- 1000
set.seed(123); X <- c(rnorm(N/2, mean=-2), rnorm(N/2,mean=2)); U <- rnorm(N,sd=1)
msigma <- 0.5
#msigma <- runif(N,min=0.3,max=0.5)
W <- X + msigma*U
lambda1 <- lambda.select(W, msigma=msigma)




