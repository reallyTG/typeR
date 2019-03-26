library(copula)


### Name: gofTstat
### Title: Goodness-of-fit Test Statistics
### Aliases: gofTstat
### Keywords: htest goodness-of-fit distribution multivariate

### ** Examples

## generate data
cop <- archmCopula("Gumbel", param=iTau(gumbelCopula(), 0.5), dim=5)
set.seed(1)
U <- rCopula(1000, cop)

## compute Sn (as is done in a parametric bootstrap, for example)
Uhat <- pobs(U) # pseudo-observations
u <- cCopula(Uhat, copula = cop) # Rosenblatt transformed data (with correct copula)
gofTstat(u, method = "Sn", copula = cop) # compute test statistic Sn; requires copula argument



