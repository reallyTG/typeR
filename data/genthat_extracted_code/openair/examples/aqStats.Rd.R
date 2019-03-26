library(openair)


### Name: aqStats
### Title: Calculate summary statistics for air pollution data by year
### Aliases: aqStats
### Keywords: methods

### ** Examples


## Statistics for 2004. NOTE! these data are in ppb/ppm so the
## example is for illustrative purposes only
aqStats(selectByDate(mydata, year = 2004), pollutant = "no2")





