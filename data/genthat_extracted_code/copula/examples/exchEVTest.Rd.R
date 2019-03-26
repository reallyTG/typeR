library(copula)


### Name: exchEVTest
### Title: Test of Exchangeability for Certain Bivariate Copulas
### Aliases: exchEVTest
### Keywords: htest multivariate

### ** Examples

## Data from an exchangeable left-tail decreasing copulas
exchEVTest(rCopula(200,  gumbelCopula(3)))
## No test: 
exchEVTest(rCopula(200, claytonCopula(3)))
## End(No test)

## An asymmetric Khoudraji-Gumbel-Hougaard copula
kc <- khoudrajiCopula(copula1 = indepCopula(),
                      copula2 = gumbelCopula(4),
                      shapes = c(0.4, 0.95))
exchEVTest(rCopula(200, kc))



