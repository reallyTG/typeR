library(AppliedPredictiveModeling)


### Name: bookTheme
### Title: Lattice Themes
### Aliases: bookTheme transparentTheme
### Keywords: hplot

### ** Examples

library(lattice)

example <- quadBoundaryFunc(100)

bookTheme(set = TRUE)
xyplot(X2 ~ X1, data = example, groups = class, auto.key = TRUE)

transparentTheme(set = TRUE, trans = .6)
xyplot(X2 ~ X1, data = example, groups = class, auto.key = TRUE)



