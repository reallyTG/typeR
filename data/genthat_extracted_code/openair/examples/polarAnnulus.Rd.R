library(openair)


### Name: polarAnnulus
### Title: Bivariate polarAnnulus plot
### Aliases: polarAnnulus
### Keywords: methods

### ** Examples



# load example data from package
data(mydata)

# diurnal plot for PM10 at Marylebone Rd
## Not run: 
##D polarAnnulus(mydata, pollutant = "pm10",
##D main = "diurnal variation in pm10 at Marylebone Road")
## End(Not run)

# seasonal plot for PM10 at Marylebone Rd
## Not run: polarAnnulus(mydata, poll="pm10", period = "season")

# trend in coarse particles (PMc = PM10 - PM2.5), calculate PMc first

mydata$pmc <- mydata$pm10 - mydata$pm25
## Not run: 
##D polarAnnulus(mydata, poll="pmc", period = "trend",
##D main = "trend in pmc at Marylebone Road")
## End(Not run)





