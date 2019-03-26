library(covatest)


### Name: read.STdata
### Title: Imports a text file in R
### Aliases: read.STdata

### ** Examples

#example 1: import a text file, with dates stored in a single column (the 4th)
# and fill missing time points in monthly time series, with time lag equal to one

file_date <- system.file("extdata", "file_date.txt", package = "covatest")
db.date <- read.STdata(file = file_date, header = TRUE, iclx = 2, icly = 3, iclt = 0,
icldate = c(icl.date = 4, iclty = 0, icltm = 0, icltd = 0),
icltime = c(icl.time = 0, icltH =0, icltM = 0, icltS = 0),
iclvr = 5, iclsp = 1, missing.v = -99999, save.as = "data.frame",
date.format = c("Date", "%d-%m-%Y"), bytime = "%m", tlag = 1)


#example 2: import a text file, with dates and times stored in different columns
# (from the 4th to the 9th) and fill missing time points in hourly time series,
# with time lag equal to three

file_datetime <- system.file("extdata", "file_datetime.txt", package = "covatest")
db.datetime <- read.STdata(file = file_datetime, header = TRUE, iclx = 2, icly = 3, iclt = 0,
icldate = c(icl.date = 0, iclty = 6, icltm = 5, icltd = 4),
icltime = c(icl.time = 0, icltH = 7, icltM = 8, icltS = 9),
iclvr = 10, iclsp = 1, missing.v = -99999, save.as = "data.frame",
date.format = c("POSIX", "%Y %m %d %H %M %S"), bytime = "%H", tlag = 3)


#example 3: import a text file, with dates and times stored in different columns
# (from the 4th to the 9th) and fill missing time points in quarterly time series,
# with time lag equal to one

file_yq <- system.file("extdata", "file_yq.txt", package = "covatest")
db.yq <- read.STdata(file = file_yq, header = TRUE, iclx = 2, icly = 3, iclt = 0,
icldate = c(icl.date = 4, iclty = 0, icltm = 0, icltd = 0),
icltime = c(icl.time = 0, icltH =0, icltM = 0, icltS = 0),
iclvr = 5, iclsp = 1, missing.v = -99999, save.as = "data.frame",
date.format = c("yearqtr", "%Y-Q%q"), bytime = "%q", tlag = 1)





