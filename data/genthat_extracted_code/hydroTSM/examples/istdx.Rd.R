library(hydroTSM)


### Name: istdx
### Title: Inverse Standarization
### Aliases: istdx istdx.default istdx.matrix istdx.data.frame
### Keywords: manip

### ** Examples

## Loading daily streamflows at the station Oca en Ona (Ebro River basin, Spain) ##
data(OcaEnOnaQts)
x <- OcaEnOnaQts

## Computing xmin and the range of 'x'
xmin <- min(x, na.rm=TRUE)
r <- diff(range(x, na.rm=TRUE))

## Standarized variable
s <- stdx(x)

## Inverse of the standarized variable
si <- istdx(s, xmin, xrange=r)

## 'si' and 'x' should be the same
summary(x-si)

###########
### Standarizing a subset of the stations 9 to 12 in 'EbroPPtsMonthly'

## Loading the monthly time series of precipitation within the Ebro River basin.
data(EbroPPtsMonthly)

pp <- EbroPPtsMonthly[1:70,10:13]
xmin   <- apply(pp, 2, min, na.rm=TRUE)
xrange <- apply(pp, 2, range, na.rm=TRUE)
xrange <- apply(xrange, 2, diff, na.rm=TRUE)

## Standarized variable
s <- stdx(as.matrix(pp))

## Inverse of the standarized variable
si <- istdx(s, xmin, xrange)

## 'si' and 'pp' should be the same
summary(pp - si)




