library(clickR)


### Name: check_quality
### Title: Checks data quality of a variable
### Aliases: check_quality

### ** Examples

check_quality(airquality$Ozone)  #For one variable
lapply(airquality, check_quality)  #For a data.frame
lapply(airquality, check_quality, output=TRUE)  #For a data.frame, one row per variable



