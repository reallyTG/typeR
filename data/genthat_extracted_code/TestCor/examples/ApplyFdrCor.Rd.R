library(TestCor)


### Name: ApplyFdrCor
### Title: Applies multiple testing procedures built to control
###   (asymptotically) the FDR for correlation testing.
### Aliases: ApplyFdrCor

### ** Examples

n <- 100
p <- 10
corr_theo <- diag(1,p)
data <- MASS::mvrnorm(n,rep(0,p),corr_theo)
alpha <- 0.05
res <- ApplyFdrCor(data,alpha,stat_test='empirical',method='LCTnorm')



