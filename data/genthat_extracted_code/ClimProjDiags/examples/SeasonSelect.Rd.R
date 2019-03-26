library(ClimProjDiags)


### Name: SeasonSelect
### Title: Selects a season from daily data for multidimensional arrays
### Aliases: SeasonSelect

### ** Examples

## Example with synthetic data:
data <- 1:(2 * 3 * (366 + 365) * 2)
dim(data) <- c(lon = 2, lat = 3, time = 366 + 365, model = 2)
time <- seq(ISOdate(1903,1,1), ISOdate(1904,12,31), "days")
time <- as.POSIXct(time, tz = "CET")
metadata <- list(time = list(standard_name = 'time', long_name = 'time', 
                            calendar = 'noleap',
                            units = 'days since 1970-01-01 00:00:00', prec = 'double', 
                            dim = list(list(name ='time', unlim = FALSE))))
attr(time, "variables") <- metadata
attr(data, 'Variables')$dat1$time <- time
attr(data, 'Variables')$dat2$time <- time
attr(data, 'Variables')$common[[2]]$dim[[3]]$len = length(time)
attr(data, 'Variables')$common[[2]]$dim[[3]]$vals <- time

a <- SeasonSelect(data = data, season = 'JJA')
str(a)



