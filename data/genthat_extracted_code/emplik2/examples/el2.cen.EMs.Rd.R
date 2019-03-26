library(emplik2)


### Name: el2.cen.EMs
### Title: Computes p-value for a single mean-type hypothesis, based on two
###   independent samples that may contain censored data.
### Aliases: el2.cen.EMs
### Keywords: nonparametric

### ** Examples
 
x<-c(10,80,209,273,279,324,391,415,566,785,852,881,895,954,1101,
1133,1337,1393,1408,1444,1513,1585,1669,1823,1941)
dx<-c(1,2,1,1,1,1,1,2,1,1,1,1,1,1,1,0,0,1,0,0,0,0,1,1,0)
y<-c(21,38,39,51,77,185,240,289,524,610,612,677,798,881,899,946,
1010,1074,1147,1154,1199,1269,1329,1484,1493,1559,1602,1684,1900,1952)
dy<-c(1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,0,1,1,1,0,0,0,0,0,0,1,0,0,0)

# Ho1:  X is stochastically equal to Y
el2.cen.EMs(x, dx, y, dy, fun=function(x,y){x>=y}, mean=0.5, maxit=25)
# Result: Pval = 0.7090658, so we cannot with 95 percent confidence reject Ho1

# Ho2: mean of X equals mean of Y
el2.cen.EMs(x, dx, y, dy, fun=function(x,y){x-y}, mean=0.5, maxit=25)
# Result: Pval = 0.9695593, so we cannot with 95 percent confidence reject Ho2



