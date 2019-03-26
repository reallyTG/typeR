library(adaptTest)


### Name: adaptTest-package
### Title: Adaptive two-stage tests
### Aliases: adaptTest-package adaptTest
### Keywords: package

### ** Examples

## Example from Bauer and Koehne (1994)
alpha  <- 0.1
alpha2 <- 0.1
alpha0 <- 0.5
alpha1 <- tsT(typ="b", a=alpha, a0=alpha0, a2=alpha2)
plotCEF(typ="b", a2=alpha2, add=FALSE)
plotBounds(alpha1, alpha0)
CEF(typ="b", a2=alpha2)



