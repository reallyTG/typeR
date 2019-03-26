library(skyscapeR)


### Name: reduct.compass
### Title: Data reduction for compass measurements
### Aliases: reduct.compass

### ** Examples

loc <- c(35,-7)
mag.az <- c(89.5, 105, 109.5)
data <- reduct.compass(loc, mag.az, "2016/04/02")

# Declination will be automatically calculated if the altitude is also given:
data <- reduct.compass(loc, mag.az, "2016/04/02", alt=c(1,2,0))

# Alternatively, the altitude can be automatically retrieved from a horizon profile:
hor <- download.HWT('NML6GMSX')
data <- reduct.compass(hor, mag.az, "2016/04/02")



