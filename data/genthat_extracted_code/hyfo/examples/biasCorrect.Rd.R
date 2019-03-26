library(hyfo)


### Name: biasCorrect
### Title: Biascorrect the input timeseries or hyfo dataset
### Aliases: biasCorrect
###   biasCorrect,data.frame,data.frame,data.frame-method
###   biasCorrect,list,list,list-method

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
# Since the example data, has some NA values, the process will include some warning #message, 
# which can be ignored in this case.




# Then we will use nc data as forecasting data, and use itself as hindcast data,
# use tgridData as observation.
newFrc <- biasCorrect(nc, nc, tgridData)  
newFrc <- biasCorrect(nc, nc, tgridData, scaleType = 'add')   
newFrc <- biasCorrect(nc, nc, tgridData, method = 'eqm', extrapolate = 'constant', 
preci = TRUE) 
newFrc <- biasCorrect(nc, nc, tgridData, method = 'gqm', preci = TRUE) 


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

# default method is scaling, with 'multi' scaleType
frc_new <- biasCorrect(frc, hindcast, obs)

# for precipitation data, extra process needs to be executed, so you have to tell
# the program that it is a precipitation data.

frc_new1 <- biasCorrect(frc, hindcast, obs, preci = TRUE)

# You can use other scaling methods to biascorrect.
frc_new2 <- biasCorrect(frc, hindcast, obs, scaleType = 'add')

# 
frc_new3 <- biasCorrect(frc, hindcast, obs, method = 'eqm', preci = TRUE)
frc_new4 <- biasCorrect(frc, hindcast, obs, method = 'gqm', preci = TRUE)

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





