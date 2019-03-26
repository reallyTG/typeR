library(ggm)


### Name: dSep
### Title: d-separation
### Aliases: dSep
### Keywords: graphs models multivariate

### ** Examples

## Conditioning on a transition node
dSep(DAG(y ~ x, x ~ z), first="y", second="z", cond = "x")
## Conditioning on a collision node (collider)
dSep(DAG(y ~ x, y ~ z), first="x", second="z", cond = "y")
## Conditioning on a source node
dSep(DAG(y ~ x, z ~ x), first="y", second="z", cond = "x")
## Marginal independence
dSep(DAG(y ~ x, y ~ z), first="x", second="z", cond = NULL)
## The DAG defined on p.~47 of Lauritzen (1996)
dag <- DAG(g ~ x, h ~ x+f, f ~ b, x ~ l+d, d ~ c, c ~ a, l ~ y, y ~ b)
dSep(dag, first="a", second="b", cond=c("x", "y"))
dSep(dag, first="a", second=c("b", "d"), cond=c("x", "y"))



