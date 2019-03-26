library(TestCor)


### Name: BonferroniCor
### Title: Bonferroni multiple testing procedure for correlations.
### Aliases: BonferroniCor

### ** Examples

n <- 100
p <- 10
corr_theo <- diag(1,p)
data <- MASS::mvrnorm(n,rep(0,p),corr_theo)
corr_mat <- cor(data)
corr_vect <- corr_mat[upper.tri(corr_mat)]
alpha <- 0.05
res <- BonferroniCor(data,alpha,stat_test='empirical')



