library(MTS)


### Name: SCCor
### Title: Sample Constrained Correlations
### Aliases: SCCor

### ** Examples

rt=matrix(rnorm(1000),200,5)
grp=c(3,2)
m1=SCCor(rt,200,200,grp)
m1$unconCor
m1$conCor



