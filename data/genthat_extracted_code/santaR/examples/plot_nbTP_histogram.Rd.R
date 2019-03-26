library(santaR)


### Name: plot_nbTP_histogram
### Title: Plot an histogram of the number of time-trajectories with a
###   given number of time-points
### Aliases: plot_nbTP_histogram

### ** Examples

## 8 subjects, 4 time-points, 3 variables, some missing values
inputData  <- acuteInflammation$data[0:32,1:3]
inputData  <- inputData[-1,]
inputData  <- inputData[-8,]
inputData  <- inputData[-30,]
inputData  <- inputData[-29,]
ind        <- acuteInflammation$meta$ind[0:32]
ind        <- ind[-1]
ind        <- ind[-8]
ind        <- ind[-30]
ind        <- ind[-29]
time       <- acuteInflammation$meta$time[0:32]
time       <- time[-1]
time       <- time[-8]
time       <- time[-30]
time       <- time[-29]
eigen      <- get_eigen_spline(inputData, ind, time, nPC=NA, scaling="scaling_UV",
                               method="nipals", verbose=TRUE, centering=TRUE, ncores=0)
plot_nbTP_histogram(eigen, dfCutOff=3)




