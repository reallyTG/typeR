library(varian)


### Name: Variability_Measures
### Title: Variability Measures
### Aliases: Variability_Measures by_id rmssd rmssd_id rolling_diff
###   rolling_diff_id sd_id
### Keywords: utilities

### ** Examples

sd_id(mtcars$mpg, mtcars$cyl, long=TRUE)
sd_id(mtcars$mpg, mtcars$cyl, long=FALSE)
rmssd(1:4)
rmssd(c(1, 3, 2, 4))
rmssd_id(mtcars$mpg, mtcars$cyl)
rmssd_id(mtcars$mpg, mtcars$cyl, long=FALSE)
rolling_diff(1:7, window = 4)
rolling_diff(c(1, 4, 3, 4, 5))
rolling_diff_id(mtcars$mpg, mtcars$cyl, window = 3)



