library(spacesXYZ)


### Name: Correlated Color Temperature
### Title: Compute Correlated Color Temperature (CCT) and Points on the
###   Planckian Locus
### Aliases: CCTfromXYZ CCTfromxy CCTfromuv planckLocus

### ** Examples

# do a round trip and then compare
temperature = c(5003,6504)
uv  = planckLocus( temperature, delta=0.05 )
CCTfromuv( uv ) - temperature  
##  2.772227e-05 5.094369e-05 

# find some points on the daylight locus, and then their CCT
temperature = seq( 2000, 10000, by=1000 )
xy = daylightLocus( temperature )
cbind( xy, CCT=CCTfromxy(xy,iso='mccamy') )
##                x         y      CCT
## D2000         NA        NA       NA
## D3000         NA        NA       NA
## D4000  0.3823436 0.3837663 4005.717
## D5000  0.3457410 0.3586662 4999.998
## D6000  0.3216915 0.3377984 5999.437
## D7000  0.3053570 0.3216459 6997.542
## D8000  0.2937719 0.3092195 7985.318
## D9000  0.2852645 0.2995816 8948.809
## D10000 0.2787996 0.2919672 9881.115

# compare all 3 different isotherms
CCTfromxy( xy, isotherms=c('robertson',NA,'mccamy') )
##        Robertson   native   McCamy
## D2000         NA       NA       NA
## D3000         NA       NA       NA
## D4000   4000.096 4000.062 4005.717
## D5000   4999.749 4999.608 4999.998
## D6000   5998.015 5999.242 5999.437
## D7000   6997.858 6998.258 6997.542
## D8000   7997.599 7996.985 7985.318
## D9000   8999.301 8993.811 8948.809
## D10000  9991.920 9992.672 9881.115

cbind( default=CCTfromxy(xy), prec.native=CCTfromxy(xy,locus='prec',iso=NA) )
##         default prec.native
## 2000K        NA          NA
## 3000K        NA          NA
## 4000K  4000.096    4000.052
## 5000K  4999.749    4999.767
## 6000K  5998.015    5999.097
## 7000K  6997.858    6997.857
## 8000K  7997.599    7997.951
## 9000K  8999.301    8995.835
## 10000K 9991.920    9992.839



