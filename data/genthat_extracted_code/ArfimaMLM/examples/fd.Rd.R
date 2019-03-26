library(ArfimaMLM)


### Name: fd
### Title: Estimate fractional differencing parameter and/or differenciate
###   series for a given d-value
### Aliases: fd fd.default fd.numeric
### Keywords: ts manip

### ** Examples

require(fractal)
require(fracdiff)

set.seed(123)
series=fracdiff.sim(100, d=0.4, mu=10)$series

## S3 method for class 'character'
# estimates fractional differencing parameter d
# and differenciates series accordingly
series.fd1<-fd(series)
series.fd2<-fd(series, dval="ML")
series.fd3<-fd(series, dval="GPH")
series.fd4<-fd(series, dval="Sperio")

## S3 method for class 'numeric'
# differenciates series according to 
# externally provided differencing parameter
series.fd5<-fd(series, dval=0.4)



