library(ggm)


### Name: conComp
### Title: Connectivity components
### Aliases: conComp
### Keywords: graphs models multivariate

### ** Examples

## three connected components
conComp(UG(~a*c+c*d+e+g*o*u))
## a connected graph
conComp(UG(~ a*b+b*c+c*d+d*a))



