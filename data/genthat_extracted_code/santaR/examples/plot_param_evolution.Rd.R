library(santaR)


### Name: plot_param_evolution
### Title: Plot the evolution of different fitting parameters across all
###   possible df for each eigenSpline
### Aliases: plot_param_evolution

### ** Examples

## 8 subjects, 4 time-points, 3 variables
inputData  <- acuteInflammation$data[0:32,1:3]
ind        <- acuteInflammation$meta$ind[0:32]
time       <- acuteInflammation$meta$time[0:32]
eigen      <- get_eigen_spline(inputData, ind, time, nPC=NA, scaling="scaling_UV",
                               method="nipals", verbose=TRUE, centering=TRUE, ncores=0)
paramSpace <- get_param_evolution(eigen, step=0.25)
plotList   <- plot_param_evolution(paramSpace, scaled=TRUE)
plotList[1]
#do.call(grid.arrange, plotList )




