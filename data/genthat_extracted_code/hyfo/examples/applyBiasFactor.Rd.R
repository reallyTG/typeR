library(hyfo)


### Name: applyBiasFactor
### Title: Apply bias factor to different forecasts for
###   multi/operational/real time bias correction.
### Aliases: applyBiasFactor applyBiasFactor,data.frame,biasFactor-method
###   applyBiasFactor,list,biasFactor.hyfo-method

### ** Examples


######## hyfo grid file biascorrection
########

# If your input is obtained by \code{loadNcdf}, you can also directly biascorrect
# the file.

# First load ncdf file.
filePath <- system.file("extdata", "tnc.nc", package = "hyfo")
varname <- getNcdfVar(filePath)    
nc <- loadNcdf(filePath, varname)

data(tgridData)
#' # Since the example data, has some NA values, the process will include some warning #message, 
# which can be ignored in this case.



# Then we will use nc data as forecasting data, and use itself as hindcast data,
# use tgridData as observation.

biasFactor <- getBiasFactor(nc, tgridData)
newFrc <- applyBiasFactor(nc, biasFactor)
   
biasFactor <- getBiasFactor(nc, tgridData, method = 'eqm', extrapolate = 'constant',
preci = TRUE)
# This method needs obs input.
newFrc <- applyBiasFactor(nc, biasFactor, obs = tgridData)

biasFactor <- getBiasFactor(nc, tgridData, method = 'gqm', preci = TRUE)
newFrc <- applyBiasFactor(nc, biasFactor) 


######## Time series biascorrection
########

# Use the time series from testdl as an example, we take frc, hindcast and obs from testdl.
data(testdl)

# common period has to be extracted in order to better train the forecast.

datalist <- extractPeriod(testdl, startDate = '1994-1-1', endDate = '1995-10-1')

frc <- datalist[[1]]
hindcast <- datalist[[2]]
obs <- datalist[[3]]


# The data used here is just for example, so there could be negative data.

# default method is scaling
biasFactor <- getBiasFactor(hindcast, obs)
frc_new <- applyBiasFactor(frc, biasFactor)

# for precipitation data, extra process needs to be executed, so you have to tell
# the program to it is a precipitation data.

biasFactor <- getBiasFactor(hindcast, obs, preci = TRUE)
frc_new1 <- applyBiasFactor(frc, biasFactor)

# You can use other methods to biascorrect, e.g. delta method. 
biasFactor <- getBiasFactor(hindcast, obs, method = 'delta')
# delta method needs obs input.
frc_new2 <- applyBiasFactor(frc, biasFactor, obs = obs)

# 
biasFactor <- getBiasFactor(hindcast, obs, method = 'eqm', preci = TRUE)
# eqm needs obs input
frc_new3 <- applyBiasFactor(frc, biasFactor, obs = obs)

biasFactor <- getBiasFactor(hindcast, obs, method = 'gqm', preci = TRUE)
frc_new4 <- applyBiasFactor(frc, biasFactor)

plotTS(obs, frc, frc_new, frc_new1, frc_new2, frc_new3, frc_new4, plot = 'cum')

# You can also give name to this input list.
TSlist <- list(obs, frc, frc_new, frc_new1, frc_new2, frc_new3, frc_new4)
names(TSlist) <- c('obs', 'frc', 'delta', 'delta_preci', 'scale', 'eqm', 'gqm')
plotTS(list = TSlist, plot = 'cum')


# If the forecasts you extracted only has incontinuous data for certain months and years, e.g.,
# for seasonal forecasting, forecasts only provide 3-6 months data, so the case can be 
# for example Dec, Jan and Feb of every year from year 1999-2005.
# In such case, you need to extract certain months and years from observed time series.
# extractPeriod() can be then used.
  
  



# More examples can be found in the user manual on https://yuanchao-xu.github.io/hyfo/





