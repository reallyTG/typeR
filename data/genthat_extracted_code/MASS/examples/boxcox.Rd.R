library(MASS)


### Name: boxcox
### Title: Box-Cox Transformations for Linear Models
### Aliases: boxcox boxcox.default boxcox.formula boxcox.lm
### Keywords: regression models hplot

### ** Examples

boxcox(Volume ~ log(Height) + log(Girth), data = trees,
       lambda = seq(-0.25, 0.25, length = 10))

boxcox(Days+1 ~ Eth*Sex*Age*Lrn, data = quine,
       lambda = seq(-0.05, 0.45, len = 20))



