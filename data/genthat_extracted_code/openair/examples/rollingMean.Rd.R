library(openair)


### Name: rollingMean
### Title: Calculate rollingMean values
### Aliases: rollingMean
### Keywords: methods

### ** Examples


## rolling 8-hour mean for ozone
mydata <- rollingMean(mydata, pollutant = "o3", width = 8, new.name =
"rollingo3", data.thresh = 75, align = "right")





