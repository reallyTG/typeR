library(TestCor)


### Name: SimuFwer
### Title: Simulates Gaussian data with a given correlation matrix and
###   applies a FWER controlling procedure on the correlations.
### Aliases: SimuFwer

### ** Examples

Nsimu <- 1000 
n <- 100
p <- 10
corr_theo <- diag(1,p)
alpha <- 0.05
res <- SimuFwer(corr_theo,n,Nsimu,alpha,stat_test='empirical',method='Bonferroni',stepdown=FALSE)



