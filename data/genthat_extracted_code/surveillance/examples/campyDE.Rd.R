library(surveillance)


### Name: campyDE
### Title: Campylobacteriosis and Absolute Humidity in Germany 2002-2011
### Aliases: campyDE
### Keywords: datasets

### ** Examples

  #Load the data
  data("campyDE")

  #O104 period is W21-W30 in 2011
  stopifnot(all(campyDE$O104period == (
      (campyDE$date >= as.Date("2011-05-23")) &
      (campyDE$date < as.Date("2011-07-31"))
  )))

  #Make an sts object from the data.frame
  cam.sts <- sts(epoch=as.numeric(campyDE$date), epochAsDate=TRUE,
                 observed=campyDE$case, state=campyDE$state)

  #Plot the result
  plot(cam.sts)



