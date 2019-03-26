library(TestCor)


### Name: BHCor
### Title: Benjamini & Hochberg (1995)'s procedure for correlation testing.
### Aliases: BHCor

### ** Examples

 
n <- 100
p <- 10
corr_theo <- diag(1,p)
data <- MASS::mvrnorm(n,rep(0,p),corr_theo)
alpha <- 0.05
res <- BHCor(data,alpha,stat_test='empirical')



