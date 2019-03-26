library(TestCor)


### Name: SidakCor
### Title: Sidak multiple testing procedure for correlations.
### Aliases: SidakCor

### ** Examples

 
n <- 100
p <- 10
corr_theo <- diag(1,p)
data <- MASS::mvrnorm(n,rep(0,p),corr_theo)
corr_mat <- cor(data)
corr_vect <- corr_mat[upper.tri(corr_mat)]
alpha <- 0.05
res <- SidakCor(data,alpha,stat_test='empirical')



