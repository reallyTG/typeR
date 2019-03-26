library(ggm)


### Name: basiSet
### Title: Basis set of a DAG
### Aliases: basiSet
### Keywords: graphs models multivariate

### ** Examples

## See Shipley (2000), Figure 2, p. 213
A <- DAG(x5~ x3+x4, x3~ x2, x4~x2, x2~ x1)
basiSet(A)



