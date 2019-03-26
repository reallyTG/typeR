library(dat)


### Name: DataFrame
### Title: DataFrame and methods
### Aliases: DataFrame DataFrame as.DataFrame as.DataFrame.default
###   as.DataFrame.data.frame [.DataFrame

### ** Examples

data("airquality")
dat <- as.DataFrame(airquality)
dat[~ Month > 4, ][meanWind ~ mean(Wind), sby = "Month"]["meanWind"]
dat[FL(.n ~ mean(.n), .n = c("Wind", "Temp")), sby = "Month"]




