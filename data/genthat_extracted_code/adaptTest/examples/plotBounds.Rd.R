library(adaptTest)


### Name: plotBounds
### Title: Function to plot the stopping bounds of an adaptive two-stage
###   test
### Aliases: plotBounds

### ** Examples

## Example from Bauer and Koehne (1994): full level after final stage, alpha0 = 0.5
alpha  <- 0.1
alpha2 <- 0.1
alpha0 <- 0.5
alpha1 <- tsT(typ="b", a=alpha, a0=alpha0, a2=alpha2)
plotCEF(typ="b", a2=alpha2, add=FALSE)
plotBounds(alpha1, alpha0)



