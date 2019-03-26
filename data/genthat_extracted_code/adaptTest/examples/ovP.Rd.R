library(adaptTest)


### Name: ovP
### Title: Function to compute and visualize overall p-values
### Aliases: ovP

### ** Examples

## Visualize a Lehmacher Wassmer (1999) test to the overall level 0.1
## and compute and visualize the overall p-value for an observed (p1,p2)=(0.3,0.7)
alpha  <- .1
alpha0 <- .5
alpha1 <- .05
plotBounds(a1=alpha1, a0=alpha0, add=FALSE)
plotCEF(typ="l", a2=tsT(typ="l", a=alpha, a0=alpha0, a1=alpha1))
plotCEF(typ="l", p1=.3, p2=.7)
ovP(typ="l", p1=.3, p2=.7, a1=alpha1, a0=alpha0)
# The overall p-value is the area left of alpha1, plus the area below the 
# conditional error function running though (0.3,0.7) between alpha1 and alpha0.

## Investigate the p-values of the Lehmacher Wassmer (1999) test from above
ovP(typ="l", a1=alpha1, a0=alpha0, grid=TRUE, p1=1:9/10, round=3)
ovP(typ="l", a1=alpha1, a0=alpha0, grid=TRUE, plt=TRUE, invisible=TRUE, wire=TRUE)



