library(openair)


### Name: importAURNCsv
### Title: AURN csv file data import for openair
### Aliases: importAURNCsv
### Keywords: methods

### ** Examples



##########
#example 1
##########
#data obtained from email service:
#http://www.airquality.co.uk/archive/data_selector.php
#or
#http://www.airquality.co.uk/archive/data_and_statistics.php?action=step_pre_1
#example file "AirQualityDataHourly.csv" Brighton Roadside and Brighton Preston Park 2008.

#import data as mydata
## mydata <- importAURN.csv("AirQualityDataHourly.csv")

#read additional information retained by importAURN
## comment(mydata)

#analysis data by site
## boxplot(nox ~ site, data = mydata)

##########
#example 2
##########
#example using data from url

#import data as otherdata
## otherdata <- importAURN.csv(
##  "http://www.airquality.co.uk/archive/data_files/site_data/HG1_2007.csv")

#use openair function
## summarise(otherdata)

##########
#example 3
##########
#example of importing other similar data formats

#import 15 min average so2 data from Bexley using url
## so2.15min.data <- importAURN.csv(
##  "http://www.airquality.co.uk/archive/data_files/15min_site_data/BEX_2008.csv",
##  correct.time = -900)

#note: correct.time amended for 15 min offset/correction.

#additional comments
## comment(so2.15min.data)

#analysis
## diurnal.error(so2.15min.data, pollutant="so2")

#wrapper for above operation
##(e.g. if you have to do this -or similar- a lot of time)
## my.import.wrapper <- function(file, correct.time = -900, ...)
##  { importAURN.csv(file = file, correct.time = correct.time, ...) }

#same as above
## so2.15min.data.again <- my.import.wrapper(
##  "http://www.airquality.co.uk/archive/data_files/15min_site_data/BEX_2008.csv")

#analysis
## timeVariation(so2.15min.data.again, pollutant="so2")





