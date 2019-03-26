library(skyscapeR)


### Name: reduct.theodolite
### Title: Data reduction for theodolite measurements using the sun-sight
###   method
### Aliases: reduct.theodolite

### ** Examples

lat <- ten(35,50,37.8)
lon <- ten(14,34,6.4)
az <- c( ten(298,24,10), ten(302,20,40))
az.sun <- ten(327,29,50)
date <- "2016/02/20"
time <- "11:07:17"

data <- reduct.theodolite(c(lat,lon), az, date , time, tz= "Europe/Malta", az.sun)

# Declination will be automatically calculated if the altitude is also given:
data <- reduct.theodolite(c(lat,lon), az, date , time, tz= "Europe/Malta", az.sun, alt=c(2,5))

# Alternatively, the altitude can be automatically retrieved from a horizon profile:
hor <- download.HWT('UFXERSLQ')
data <- reduct.theodolite(hor, az, date, time, tz= "Europe/Malta", az.sun)



