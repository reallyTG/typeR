library(dtwclust)


### Name: reinterpolate
### Title: Wrapper for simple linear reinterpolation
### Aliases: reinterpolate

### ** Examples


data(uciCT)

# list of univariate series
series <- reinterpolate(CharTraj, 205L)

# list of multivariate series
series <- reinterpolate(CharTrajMV, 205L)

# single multivariate series
series <- reinterpolate(CharTrajMV[[1L]], 205L, TRUE)




