library(santaR)


### Name: get_eigen_DFoverlay_list
### Title: Plot for each eigenSpline the automatically fitted spline,
###   splines for all df and a spline at a chosen df
### Aliases: get_eigen_DFoverlay_list

### ** Examples

## 8 subjects, 4 time-points, 3 variables
inputData  <- acuteInflammation$data[0:32,1:3]
ind        <- acuteInflammation$meta$ind[0:32]
time       <- acuteInflammation$meta$time[0:32]
eigen      <- get_eigen_spline(inputData, ind, time, nPC=NA, scaling="scaling_UV",
                               method="nipals", verbose=TRUE, centering=TRUE, ncores=0)
paramSpace <- get_param_evolution(eigen, step=1)
plotList   <- get_eigen_DFoverlay_list(eigen,manualDf=3,step=0.5,showPt=TRUE,autofit=TRUE)
plotList[1]
# do.call(grid.arrange, plotList)




