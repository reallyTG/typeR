library(RKUM)


### Name: ifcca
### Title: Influence Funciton of Canonical Correlation Analysis
### Aliases: ifcca

### ** Examples


##Dummy data:

X <- matrix(rnorm(500),100); Y <- matrix(rnorm(500),100)

ifcca(X,Y,  1e-05,  2, 2)



