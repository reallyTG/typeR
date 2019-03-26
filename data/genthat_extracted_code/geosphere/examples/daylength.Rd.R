library(geosphere)


### Name: daylength
### Title: Daylength
### Aliases: daylength
### Keywords: spatial

### ** Examples

daylength(-25, '2010-10-10')
daylength(45, 1:365)

# average monthly daylength
dl <- daylength(45, 1:365)
tapply(dl, rep(1:12, c(31,28,31,30,31,30,31,31,30,31,30,31)), mean)




