library(TestCor)


### Name: ApplyFwerCor_oracle
### Title: Applies an oracle version of MaxTinfty procedure described in
###   Drton & Perlman (2007) for correlation testing.
### Aliases: ApplyFwerCor_oracle

### ** Examples

n <- 100
p <- 10
corr_theo <- diag(1,p)
data <- MASS::mvrnorm(n,rep(0,p),corr_theo)
alpha <- 0.05
res <- ApplyFwerCor_oracle(data,corr_theo,alpha,stat_test='empirical',Nboot=1000,stepdown=FALSE)



