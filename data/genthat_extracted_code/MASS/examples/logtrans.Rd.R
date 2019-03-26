library(MASS)


### Name: logtrans
### Title: Estimate log Transformation Parameter
### Aliases: logtrans logtrans.formula logtrans.lm logtrans.default
### Keywords: regression models hplot

### ** Examples

logtrans(Days ~ Age*Sex*Eth*Lrn, data = quine,
         alpha = seq(0.75, 6.5, len=20))



