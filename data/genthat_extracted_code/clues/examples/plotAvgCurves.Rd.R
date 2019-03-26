library(clues)


### Name: plotAvgCurves
### Title: Average Trajectory Plot for Each Cluster
### Aliases: plotAvgCurves
### Keywords: cluster

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



