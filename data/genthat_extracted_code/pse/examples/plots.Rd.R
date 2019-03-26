library(pse)


### Name: plotcv
### Title: Uncertainty and Sensitivity Plots.
### Aliases: plotcv plotecdf plotprcc plotscatter

### ** Examples

myLHS <- LHS(model=function(x) x[,1]+x[,2]*x[,3], factors=3, N=20, res.names="My Output")
plotecdf(myLHS, main="ECDF plot")
plotprcc(myLHS, main="PRCC plot")
plotscatter(myLHS)



