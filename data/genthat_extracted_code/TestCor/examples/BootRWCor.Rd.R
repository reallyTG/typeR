library(TestCor)


### Name: BootRWCor
### Title: Bootstrap multiple testing method of Romano & Wolf (2005) for
###   correlations.
### Aliases: BootRWCor

### ** Examples

 
n <- 100
p <- 10
corr_theo <- diag(1,p)
data <- MASS::mvrnorm(n,rep(0,p),corr_theo)
alpha <- 0.05
res <- BootRWCor(data,alpha,stat_test='empirical',Nboot=1000)



