library(TestCor)


### Name: LCTnorm
### Title: Procedure LCT-N proposed by Cai & Liu (2016) for correlation
###   testing.
### Aliases: LCTnorm

### ** Examples

 
n <- 100
p <- 10
corr_theo <- diag(1,p)
data <- MASS::mvrnorm(n,rep(0,p),corr_theo)
alpha <- 0.05
res <- LCTnorm(data,alpha,stat_test='empirical')



