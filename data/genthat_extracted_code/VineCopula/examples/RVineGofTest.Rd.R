library(VineCopula)


### Name: RVineGofTest
### Title: Goodness-of-Fit Tests for R-Vine Copula Models
### Aliases: RVineGofTest

### ** Examples

## No test: 
## time-consuming example

# load data set
data(daxreturns)

# select the R-vine structure, families and parameters
RVM <- RVineStructureSelect(daxreturns[,1:5], c(1:6))

# White test with asymptotic p-value
RVineGofTest(daxreturns[,1:5], RVM, B = 0)

# ECP2 test with Cramer-von-Mises test statistic and a bootstrap
# with 200 replications for the calculation of the p-value
RVineGofTest(daxreturns[,1:5], RVM, method = "ECP2",
             statistic = "CvM", B = 200)
## End(No test)




