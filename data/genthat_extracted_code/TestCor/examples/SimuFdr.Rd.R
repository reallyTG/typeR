library(TestCor)


### Name: SimuFdr
### Title: Simulates Gaussian data with a given correlation matrix and
###   applies a FDR controlling procedure on the correlations.
### Aliases: SimuFdr

### ** Examples

Nsimu <- 1000
n <- 100
p <- 10
corr_theo <- diag(1,p)
alpha <- 0.05
res <- SimuFdr(corr_theo,n,Nsimu,alpha,stat_test='empirical',method='LCTnorm')



