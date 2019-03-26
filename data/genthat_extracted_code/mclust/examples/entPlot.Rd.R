library(mclust)


### Name: entPlot
### Title: Plot Entropy Plots
### Aliases: entPlot
### Keywords: cluster

### ** Examples

## Not run: 
##D data(Baudry_etal_2010_JCGS_examples)
##D # run Mclust to get the MclustOutput
##D output <- clustCombi(data = ex4.2, modelNames = "VII") 
##D 
##D entPlot(output$MclustOutput$z, output$combiM, reg = c(2,3)) 
##D # legend: in red, the single-change-point piecewise linear regression;
##D #         in blue, the two-change-point piecewise linear regression.
## End(Not run)



