library(openair)


### Name: timeVariation
### Title: Diurnal, day of the week and monthly variation
### Aliases: timeVariation
### Keywords: methods

### ** Examples



# basic use
timeVariation(mydata, pollutant = "nox")

# for a subset of conditions
## Not run: 
##D timeVariation(subset(mydata, ws > 3 & wd > 100 & wd < 270),
##D pollutant = "pm10", ylab = "pm10 (ug/m3)")
## End(Not run)

# multiple pollutants with concentrations normalised
## Not run: timeVariation(mydata, pollutant = c("nox", "co"), normalise = TRUE)

# show BST/GMT variation (see ?cutData for more details)
# the NOx plot shows the profiles are very similar when expressed in
# local time, showing that the profile is dominated by a local source
# that varies by local time and not by GMT i.e. road vehicle emissions

## Not run: timeVariation(mydata, pollutant = "nox", type = "dst", local.tz = "Europe/London")

## In this case it is better to group the results for clarity:
## Not run: timeVariation(mydata, pollutant = "nox", group = "dst", local.tz = "Europe/London")

# By contrast, a variable such as wind speed shows a clear shift when
#  expressed in local time. These two plots can help show whether the
#  variation is dominated by man-made influences or natural processes

## Not run: timeVariation(mydata, pollutant = "ws", group = "dst", local.tz = "Europe/London")

## It is also possible to plot several variables and set type. For
## example, consider the NOx and NO2 split by levels of O3:

## Not run: timeVariation(mydata, pollutant = c("nox", "no2"), type = "o3", normalise = TRUE)

## difference in concentrations
## Not run: timeVariation(mydata, poll= c("pm25", "pm10"), difference = TRUE)

# It is also useful to consider how concentrations vary by
# considering two different periods e.g. in intervention
# analysis. In the following plot NO2 has clearly increased but much
# less so at weekends - perhaps suggesting vehicles other than cars
# are important because flows of cars are approximately invariant by
# day of the week

## Not run: 
##D mydata <- splitByDate(mydata, dates= "1/1/2003", labels = c("before Jan. 2003", "After Jan. 2003"))
##D timeVariation(mydata, pollutant = "no2", group = "split.by", difference = TRUE)
## End(Not run)

## sub plots can be extracted from the openair object
## Not run: 
##D myplot <- timeVariation(mydata, pollutant = "no2")
##D plot(myplot, subset = "day.hour") # top weekday and plot
## End(Not run)

## individual plots
## plot(myplot, subset="day.hour") for the weekday and hours subplot (top)
## plot(myplot, subset="hour") for the diurnal plot
## plot(myplot, subset="day") for the weekday plot
## plot(myplot, subset="month") for the monthly plot

## numerical results (mean, lower/upper uncertainties)
## results(myplot, subset = "day.hour") # the weekday and hour data set
## summary(myplot, subset = "hour") #summary of hour data set
## head(myplot, subset = "day") #head/top of day data set
## tail(myplot, subset = "month") #tail/top of month data set

## plot quantiles and median
## Not run: 
##D timeVariation(mydata, stati="median", poll="pm10", col = "firebrick")
##D 
##D ## with different intervals
##D timeVariation(mydata, stati="median", poll="pm10", conf.int = c(0.75, 0.99),
##D col = "firebrick")
## End(Not run)




