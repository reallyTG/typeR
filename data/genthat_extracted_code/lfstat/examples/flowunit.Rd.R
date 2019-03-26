library(lfstat)


### Name: flowunit
### Title: Set and retrieve unit of the discharge
### Aliases: flowunit flowunit.lfobj flowunit.xts flowunit<-
###   flowunit<-.lfobj flowunit<-.xts
### Keywords: attribute utilities

### ** Examples

data(ray)
ray <- as.xts(ray)["1970::1970", ]

# currently discharges are in cubic metres per second
flowunit(ray)

# calculating deficit volumes, for fixed threshold 0.001 m^3/s
(s <- summary(find_droughts(ray, threshold = 0.001)))

# multiplying the discharge by 1000 converts is to litre per second
ray$discharge <- ray$discharge * 1000

# changing the unit accordingly, yields the same volumes
flowunit(ray) <- "l/s"
(ss <- summary(find_droughts(ray, threshold = 1)))

identical(s$volume, ss$volume)



