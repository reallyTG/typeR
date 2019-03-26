library(celestial)


### Name: cosvar
### Title: Driver & Robotham (2010) cosmic variance calculator
### Aliases: cosvar cosvarcar cosvarsph cosvararea
### Keywords: cosmic variance sample

### ** Examples

#Approximate CV of the GAMA equatorial regions:
cosvarsph(long=12, lat=5, zmax=0.5)*1/sqrt(3)
#Or using the GAMA sexigesimal coordinates (should be the same):
cosvarsph(long = c('11:36:0','12:24:0'), lat = c('-2:0:0','3:0:0'), zmax=0.5,
inunit='sex')*1/sqrt(3)
#Approximate CV of the SDSS:
cosvarsph(long=150, lat=100, zmax=0.3)



