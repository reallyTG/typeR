library(ClimProjDiags)


### Name: Extremes
### Title: Sum of spell lengths exceeding daily threshold for n-dimensional
###   arrays
### Aliases: Extremes

### ** Examples

##Example synthetic data:
data <- 1:(2 * 3 * 372 * 1)
dim(data) <- c(time = 372, lon = 2, lat = 3, model = 1)
time <- as.POSIXct(paste(sort(rep(1900:1911, 31)), 1, 1:31, sep = "-"), tz = "CET")
metadata <- list(time = list(standard_name = 'time', long_name = 'time',  calendar = 'noleap', 
                            units = 'days since 1970-01-01 00:00:00', prec = 'double', 
                            dim = list(list(name = 'time', unlim = FALSE))))
threshold = rep(40, 31)
attr(time, "variables") <- metadata
attr(data, 'Variables')$dat1$time <- time

a <- Extremes(data, threshold = threshold, op = ">", min.length = 6, spells.can.span.years = TRUE, 
             max.missing.days = 5, ncores = NULL)
str(a)



