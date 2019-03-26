library(clues)


### Name: Curve
### Title: Curve Data Set
### Aliases: Curve curve curve.mem
### Keywords: datasets

### ** Examples

    data(Curve)
 
    # data matrix
    curve <- Curve$curve
 
    # 'true' cluster membership
    curve.mem <- Curve$curve.mem
    # 'true' number of clusters
    nClust <- length(unique(curve.mem))
 
    # plot average trajectories
    plotAvgCurves(curve, curve.mem)




