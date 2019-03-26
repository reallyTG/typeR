library(CommonTrend)


### Name: q.Johansen
### Title: Get Johansen statistics from its P-value
### Aliases: q.Johansen
### Keywords: P-value Johansen

### ** Examples


#Traces for the fowllowing 3 cases are actually 
#12.97,24.60, 41.07 in Osterwal (1992) and in ca.jo of urca package.
#The examples here show the approximation using Doornik (1998) works very well
q.Johansen(0.01,1,"c")
q.Johansen(0.01,2,"c")
q.Johansen(0.01,3,"c")
 



