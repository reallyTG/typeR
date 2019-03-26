library(eMLEloglin)


### Name: facial_set
### Title: Finds the facial set
### Aliases: facial_set eMLEloglin
### Keywords: htest models

### ** Examples

data(rochdale)
f <- facial_set (data = rochdale, 
       formula = freq ~ a*d + a*e + b*e + c*e + e*f + a*c*g + d*g + f*g + b*d*h)
N <- sum(rochdale$freq)
BIC <- f$maxloglik - f$model.dimension * log(N) / 2
cBIC <- f$maxloglik - f$face.dimension * log(N) / 2 



