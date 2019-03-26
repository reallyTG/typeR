library(StatDA)


### Name: rg.wtdsums
### Title: Calculate Weighted Sums for a Matrix
### Aliases: rg.wtdsums
### Keywords: multivariate

### ** Examples

data(chorizon)
var=c("Si_XRF","Al_XRF","K_XRF","LOI","P","Mn")
ri=c(-2.0,1.5,2.0,2.0,3.0,2.0)
x=chorizon[,var]
rg.wtdsums(x,ri)



