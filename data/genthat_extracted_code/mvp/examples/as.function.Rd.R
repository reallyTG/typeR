library(mvp)


### Name: as.function.mvp
### Title: Functional form for multivariate polynomials
### Aliases: as.function.mvp

### ** Examples


p <- as.mvp("1+a^2 + a*b^2 + c")
p
f <- as.function(p)

f(a=1)
f(a=1,b=2)
f(a=1,b=2,c=3)
f(a=1,b=2,c=3,drop=FALSE)



