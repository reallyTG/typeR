library(VineCopula)


### Name: BiCopGofTest
### Title: Goodness-of-Fit Test for Bivariate Copulas
### Aliases: BiCopGofTest

### ** Examples


# simulate from a bivariate Clayton copula
## Don't show: 
set.seed(123)
## End(Don't show)
simdata <- BiCopSim(100, 3, 2)
u1 <- simdata[,1]
u2 <- simdata[,2]

# perform White's goodness-of-fit test for the true copula
BiCopGofTest(u1, u2, family = 3)

# perform White's goodness-of-fit test for the Frank copula
## No test: 
BiCopGofTest(u1, u2, family = 5)
## End(No test)

# perform Kendall's goodness-of-fit test for the true copula
BiCopGofTest(u1, u2, family = 3, method = "kendall", B=50)

# perform Kendall's goodness-of-fit test for the Frank copula
## No test: 
BiCopGofTest(u1, u2, family = 5, method = "kendall", B=50)
## End(No test)




