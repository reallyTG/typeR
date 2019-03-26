library(TestCor)


### Name: maxTinftyCor_SD
### Title: Multiple testing method of Drton & Perlman (2007) for
###   correlations, with stepdown procedure.
### Aliases: maxTinftyCor_SD

### ** Examples

 
n <- 100
p <- 10
corr_theo <- diag(1,p)
data <- MASS::mvrnorm(n,rep(0,p),corr_theo)
alpha <- 0.05
res <- maxTinftyCor_SD(data,alpha,stat_test='empirical',Nboot=1000)



