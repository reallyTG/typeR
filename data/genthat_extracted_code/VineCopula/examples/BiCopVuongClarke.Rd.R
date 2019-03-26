library(VineCopula)


### Name: BiCopVuongClarke
### Title: Scoring Goodness-of-Fit Test based on Vuong And Clarke Tests for
###   Bivariate Copula Data
### Aliases: BiCopVuongClarke

### ** Examples

## Don't show: 
set.seed(123)
## End(Don't show)
# simulate from a t-copula
dat <- BiCopSim(500, 2, 0.7, 5)
## Don't show: 
dat <- dat[1:100, ]
## End(Don't show)

# apply the test for families 1-6
BiCopVuongClarke(dat[,1], dat[,2], familyset = 1:6)




