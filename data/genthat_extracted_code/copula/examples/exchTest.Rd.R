library(copula)


### Name: exchTest
### Title: Test of Exchangeability for a Bivariate Copula
### Aliases: exchTest
### Keywords: htest multivariate

### ** Examples

## Data from an exchangeable copulas
exchTest(rCopula(200,  gumbelCopula(3)))
## No test: 
exchTest(rCopula(200, claytonCopula(3)))
## End(No test)

## An asymmetric Khoudraji-Clayton copula
kc <- khoudrajiCopula(copula1 = indepCopula(),
                      copula2 = claytonCopula(6),
                      shapes = c(0.4, 0.95))
exchTest(rCopula(200, kc))



