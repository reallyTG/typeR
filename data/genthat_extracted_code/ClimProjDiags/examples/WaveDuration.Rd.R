library(ClimProjDiags)


### Name: WaveDuration
### Title: Heat and cold waves duration for n-dimensional arrays
### Aliases: WaveDuration

### ** Examples

##Example synthetic data:
data <- 1:(2 * 3 * 31 * 5)
dim(data) <- c(lon = 2, lat = 3, time = 31, model = 5)
time <- as.POSIXct(paste(paste(1900, 1, 1:31, sep = "-"), paste(12, 0, 0.0, sep = ":")), tz = "CET")
metadata <- list(time = list(standard_name = 'time', long_name = 'time', calendar = 'standard', 
                units = 'days since 1970-01-01 00:00:00', prec = 'double', 
                dim = list(list(name ='time', unlim = FALSE))))
attr(time, "variables") <- metadata                 
attr(data, 'Variables')$dat1$time <- time
threshold <- rep(40, 31)

a <- WaveDuration(data, threshold, op = ">", spell.length = 6, by.seasons = TRUE, ncores = NULL)
str(a)



