library(segMGarch)


### Name: pc_Sigma
### Title: Method to simulate correlated variables with change-points
### Aliases: pc_Sigma pc_Sigma-class pc_Sigma-methods
###   pc_Sigma,simMGarch-method

### ** Examples

cp=500
n=2000
pw.CCC.obj <- new("simMGarch")
pw.CCC.obj@changepoints=cp
pw.CCC.obj@n=n
pc_Sigma.obj <- pc_Sigma(pw.CCC.obj)
par(mfrow=c(1,2))
#requires corrplot library
#correlation matrix before the changepoint
#corrplot::corrplot.mixed(cor(pc_Sigma.obj@cor_errors[1:cp,]), order="hclust", tl.col="black")
#correlation matrix after the changepoint
#corrplot::corrplot.mixed(cor(pc_Sigma.obj@cor_errors[(cp+1):n,]), order="hclust", tl.col="black")



