library(clues)


### Name: plotCurves
### Title: Plot Trajectories for Each Cluster
### Aliases: plotCurves
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
    plotCurves(curve, curve.mem)
    



