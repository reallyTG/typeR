library(ClimProjDiags)


### Name: Climdex
### Title: Wrapper for applying the climdex routine ETCCDI climate change
###   indices to n-dimensional arrays.
### Aliases: Climdex

### ** Examples

##Example synthetic data:
data <- 1:(2 * 3 * 372 * 1)
dim(data) <- c(lon = 2, lat = 3, time = 372, model = 1)
time <- c(seq(ISOdate(1900, 1, 1), ISOdate(1900, 1, 31), "day"), 
         seq(ISOdate(1901, 1, 1), ISOdate(1901, 1, 31), "day"),
         seq(ISOdate(1902, 1, 1), ISOdate(1902, 1, 31), "day"),
         seq(ISOdate(1903, 1, 1), ISOdate(1903, 1, 31), "day"),
         seq(ISOdate(1904, 1, 1), ISOdate(1904, 1, 31), "day"),
         seq(ISOdate(1905, 1, 1), ISOdate(1905, 1, 31), "day"),
         seq(ISOdate(1906, 1, 1), ISOdate(1906, 1, 31), "day"),
         seq(ISOdate(1907, 1, 1), ISOdate(1907, 1, 31), "day"),
         seq(ISOdate(1908, 1, 1), ISOdate(1908, 1, 31), "day"),
         seq(ISOdate(1909, 1, 1), ISOdate(1909, 1, 31), "day"),
         seq(ISOdate(1910, 1, 1), ISOdate(1910, 1, 31), "day"),
         seq(ISOdate(1911, 1, 1), ISOdate(1911, 1, 31), "day"))
metadata <- list(time = list(standard_name = 'time', long_name = 'time',  calendar = 'gregorian', 
                            units = 'days since 1970-01-01 00:00:00', prec = 'double', 
                            dim = list(list(name = 'time', unlim = FALSE))))
attr(time, "variables") <- metadata
attr(data, 'Variables')$dat1$time <- time

thres <- rep(10, 31 * 2 * 3)
dim(thres) <- c(jdays = 31, lon = 2, lat = 3,  model = 1)
str(thres)


clim <- Climdex(data, metric = "t90p", threshold = thres)
str(clim)



