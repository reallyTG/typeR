library(CommonTrend)


### Name: p.Johansen
### Title: P-value of Johansen statistics
### Aliases: p.Johansen
### Keywords: P-value Johansen

### ** Examples


# when type in \code{ca.jo} is \code{"const"} in Osterwal (1992) and in \code{ca.jo}
# and when there are 1,2 or 3 common trends in the VECM respectively,
# 12.97,24.60 and 41.07 are the corresponding statistics when P-value is 0.01 and 
#The examples here show the approximation using Doornik (1998) works very well
p.Johansen(12.97,1,"c")
p.Johansen(24.60,2,"c")
p.Johansen(41.07,3,"c")
 



