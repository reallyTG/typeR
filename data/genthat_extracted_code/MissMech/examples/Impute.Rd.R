library(MissMech)


### Name: Impute
### Title: Parametric and Non-Parameric Imputation
### Aliases: Impute Mimpute MimputeS

### ** Examples

set.seed <- 50
n <- 200
p <- 4
pctmiss <- 0.2
y <- matrix(rnorm(n * p),nrow = n)
missing <- matrix(runif(n * p), nrow = n) < pctmiss
y[missing] <- NA
  
yimp1 <- Impute(data=y, mu = NA, sig = NA, imputation.method = "Normal", resid = NA)
yimp2 <- Impute(data=y, mu = NA, sig = NA, imputation.method = "Dist.Free", resid = NA)




