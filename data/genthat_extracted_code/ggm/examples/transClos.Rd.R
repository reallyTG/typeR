library(ggm)


### Name: transClos
### Title: Transitive closure of a graph
### Aliases: transClos
### Keywords: graphs models multivariate

### ** Examples

## Closure of a DAG
d <- DAG(y ~ x, x ~ z)
transClos(d)

## Closure of an UG
g <- UG(~ x*y*z+z*u+u*v)
transClos(g)



