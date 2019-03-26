library(adaptTest)


### Name: tsT
### Title: Function to implement an adaptive two-stage test
### Aliases: tsT

### ** Examples

## Example from Bauer and Koehne (1994): full level after final stage, alpha0 = 0.5
alpha  <- 0.1
alpha2 <- 0.1
alpha0 <- 0.5
alpha1 <- tsT(typ="b", a=alpha, a0=alpha0, a2=alpha2)
plotCEF(typ="b", a2=alpha2, add=FALSE)
plotBounds(alpha1, alpha0)

## See how similar Lehmacher and Wassmer (1999) and Vandemeulebroecke (2006) are
alpha  <- 0.1
alpha1 <- 0.05
alpha0 <- 0.5
alpha2l <- tsT(typ="l", a=alpha, a0=alpha0, a1=alpha1)
alpha2v <- tsT(typ="v", a=alpha, a0=alpha0, a1=alpha1)
plotCEF(typ="l", a2=alpha2l, add=FALSE)
plotCEF(typ="v", a2=alpha2v, col="red")
plotBounds(alpha1, alpha0)

## A remark about numerics
tsT(typ="b", a=0.1, a1=0.05, a0=0.5)
tsT(typ="b", a=0.1, a2=0.104877, a0=0.5)
tsT(typ="b", a=0.1, a2=tsT(typ="b", a=0.1, a1=0.05, a0=0.5), a0=0.5)

## An example of non-uniqueness: the maximal alpha1 is returned; any smaller value would also be valid
alpha  <- 0.05
alpha0 <- 1
alpha2 <- 0.05
alpha1 <- tsT(typ="b", a=alpha, a0=alpha0, a2=alpha2)
tsT(typ="b", a0=alpha0, a1=alpha1, a2=alpha2)
tsT(typ="b", a0=alpha0, a1=alpha1/2, a2=alpha2)



