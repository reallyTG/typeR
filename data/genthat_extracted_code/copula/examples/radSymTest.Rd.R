library(copula)


### Name: radSymTest
### Title: Test of Exchangeability for a Bivariate Copula
### Aliases: radSymTest
### Keywords: htest multivariate

### ** Examples

## Data from radially symmetric copulas
radSymTest(rCopula(200, frankCopula(3)))
## No test: 
radSymTest(rCopula(200, normalCopula(0.7, dim = 3)))
## End(No test)

## Data from non radially symmetric copulas
radSymTest(rCopula(200, claytonCopula(3)))
## No test: 
radSymTest(rCopula(200, gumbelCopula(2, dim=3)))
## End(No test)



