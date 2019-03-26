library(TestCor)


### Name: BootRWCor_SD
### Title: Boootstrap multiple testing method of Romano & Wolf (2005) for
###   correlations, with stepdown procedure.
### Aliases: BootRWCor_SD

### ** Examples

 
n <- 100
p <- 10
corr_theo <- diag(1,p)
data <- MASS::mvrnorm(n,rep(0,p),corr_theo)
alpha <- 0.05
res <- BootRWCor_SD(data,alpha,stat_test='empirical',Nboot=1000)



