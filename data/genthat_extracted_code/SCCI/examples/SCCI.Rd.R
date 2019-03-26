library(SCCI)


### Name: SCCI
### Title: Stochastic Complexity-based Conditional Independence Criterium
### Aliases: SCCI

### ** Examples

set.seed(1)
x = round((runif(1000, min=0, max=5)))
y = round((runif(1000, min=0, max=5)))
Z = data.frame(round((runif(1000, min=0, max=5))), round((runif(1000, min=0, max=5))))
SCCI(x=x,y=y,Z=Z,score="fNML",sym=FALSE)	## 0



