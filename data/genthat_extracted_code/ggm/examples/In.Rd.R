library(ggm)


### Name: In
### Title: Indicator matrix
### Aliases: In
### Keywords: array algebra graphs multivariate

### ** Examples

## A simple way to find the overall induced concentration graph
## The DAG on p. 198 of Cox & Wermuth (1996)
amat <- DAG(y1 ~ y2 + y3, y3 ~ y5, y4 ~ y5)
A <- edgematrix(amat)
In(crossprod(A))



