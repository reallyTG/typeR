library(ClimProjDiags)


### Name: DTRIndicator
### Title: Diurnal temperature range indicator (DTR) of multidimensional
###   arrays
### Aliases: DTRIndicator

### ** Examples

##Exmaple with synthetic data:
tmax <- 1 : (2 * 3 * 730 * 1)
dim(tmax) <- c(lon = 2, lat = 3, time = 730, model = 1)
tmin <- (1 : (2 * 3 * 730 * 1)) - 1
dim(tmin) <- c(lon = 2, lat = 3, time = 730, model = 1)
time <- seq(as.POSIXct("1900-01-01 12:00:00", tz = "", format = "%Y-%d-%m %H:%M:%S"), 
           as.POSIXct("1901-31-12 18:00:00", tz = "", format = "%Y-%d-%m %H:%M:%S"), "day")
time <- as.POSIXct(time, tz = "CET")
metadata <- list(time = list(standard_name = 'time', long_name = 'time', 
                            calendar = 'noleap',
                            units = 'days since 1970-01-01 00:00:00', prec = 'double', 
                            dim = list(list(name ='time', unlim = FALSE))))
attr(time, "variables") <- metadata
attr(tmax, 'Variables')$dat1$time <- time
attr(tmax, 'Variables')$common[[2]]$dim[[3]]$len = length(time)
attr(tmax, 'Variables')$common[[2]]$dim[[3]]$vals <- time
attr(tmin, 'Variables')$dat1$time <- time
attr(tmin, 'Variables')$common[[2]]$dim[[3]]$len = length(time)
attr(tmin, 'Variables')$common[[2]]$dim[[3]]$vals <- time
a <- DTRRef(tmax, tmin, by.seasons = FALSE, ncores = NULL)

aa <- DTRIndicator(tmax, tmin, ref = a, by.seasons = FALSE, ncores = NULL)
str(aa)
dim(aa$indicator)



