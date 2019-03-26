library(hydroTSM)


### Name: fdc
### Title: Flow Duration Curve
### Aliases: fdc.default fdc.matrix fdc.data.frame fdc.zoo fdc
### Keywords: graphs manip

### ** Examples

## Loading daily streamflows at the station Oca en Ona (Ebro River basin, Spain) ##
data(OcaEnOnaQts)

## Daily Flow Duration Curve
fdc(OcaEnOnaQts)

###################
# Getting the streamflow values corresponding to 5 and 95% of time equalled or 
# exceeded (and also the first streamflow value in 'x' just for verification)
x  <- OcaEnOnaQts

# First streamflow value (x1=42.1 m3/s)
x1 <- x[1]

# Daily FDC for 'x'
y <- fdc(x)

# value of the FDC for x1 (y1=0.002739726)
y1 <- y[1]

# Performing cubic (or Hermite) spline interpolation of 'x' and 'y'
f <- splinefun(y,x)

# Getting the (known) streamflow value for 'y1'
f(y1) # 42.1 m3/s, equal to the known 'x1'

# Streamflow values corresponding to 5 and 95% of time equalled or exceeded
f(c(.05, .95))

###################
## Getting 
data(OcaEnOnaQts)

## Daily Flow Duration Curve
fdc(OcaEnOnaQts)



