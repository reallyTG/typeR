library(ClimProjDiags)


### Name: DTRRef
### Title: Diurnal temperature range of multidimensional arrays
### Aliases: DTRRef

### ** Examples

##Exmaple with synthetic data:
tmax <- 1:(2 * 3 * 365 * 1)
dim(tmax) <- c(lon = 2, lat = 3, time = 365, model = 1)
tmin <- (1:(2 * 3 * 365 * 1))-1
dim(tmin) <- c(lon = 2, lat = 3, time = 365, model = 1)
time <- seq.Date(as.Date("1900-01-01", format = "%Y-%d-%m"), 
                as.Date("1900-31-12", format = "%Y-%d-%m"), 1)
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
str(a)

tmax <- 1:(2 * 3 * 365 * 1)
dim(tmax) <- c(2, 3, 365)
tmin <- (1:(2 * 3 * 365 * 1))-1
dim(tmin) <- c(2, 3, 365)

a <- DTRRef(tmax, tmin, by.seasons = FALSE, dates = time,  timedim = 3, ncores = NULL)
str(a)



