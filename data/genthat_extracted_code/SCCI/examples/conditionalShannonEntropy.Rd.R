library(SCCI)


### Name: conditionalShannonEntropy
### Title: Conditional Shannon Entropy
### Aliases: conditionalShannonEntropy

### ** Examples

set.seed(1)
x = round((runif(1000, min=0, max=5)))
Y = data.frame(round((runif(1000, min=0, max=5))), round((runif(1000, min=0, max=5))))
conditionalShannonEntropy(x=x,y=Y) ## 2.411972



