library(SCCI)


### Name: conditionalStochasticComplexity
### Title: Conditional Stochastic Complexity for Multinomials
### Aliases: conditionalStochasticComplexity

### ** Examples

set.seed(1)
x = round((runif(1000, min=0, max=5)))
Y = data.frame(round((runif(1000, min=0, max=5))), round((runif(1000, min=0, max=5))))
conditionalStochasticComplexity(x=x,y=Y,score="fNML")	## 2779.477



