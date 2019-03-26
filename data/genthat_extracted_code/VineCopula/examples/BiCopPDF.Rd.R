library(VineCopula)


### Name: BiCopPDF
### Title: Density of a Bivariate Copula
### Aliases: BiCopPDF

### ** Examples

## Don't show: 
set.seed(123)
## End(Don't show)
## simulate from a bivariate Student-t copula
cop <- BiCop(family = 2, par = -0.7, par2 = 4)
simdata <- BiCopSim(100, cop)

## evaluate the density of the bivariate t-copula
u1 <- simdata[,1]
u2 <- simdata[,2]
BiCopPDF(u1, u2, cop)

## select a bivariate copula for the simulated data
fit <- BiCopSelect(u1, u2)
summary(fit)
## and evaluate its PDF
round(BiCopPDF(u1, u2, fit), 3)




