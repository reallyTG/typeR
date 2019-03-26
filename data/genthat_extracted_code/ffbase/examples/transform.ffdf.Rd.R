library(ffbase)


### Name: transform.ffdf
### Title: Transform a ffdf data.frame
### Aliases: transform.ffdf

### ** Examples


transform(as.ffdf(airquality), Ozone = -Ozone)
transform(as.ffdf(airquality), new = -Ozone, Temp = (Temp-32)/1.8)



