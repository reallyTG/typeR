library(TestCor)


### Name: SimuFwer_oracle
### Title: Simulates Gaussian data with a given correlation matrix and
###   applies oracle MaxTinfty on the correlations.
### Aliases: SimuFwer_oracle

### ** Examples

Nsimu <- 1000
n <- 50
p <- 10
corr_theo <- diag(1,p)
alpha <- 0.05
res <- SimuFwer_oracle(corr_theo,n,Nsimu,alpha,stat_test='empirical',stepdown=FALSE,Nboot=100)



