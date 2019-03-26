library(tswge)


### Name: kalman.miss.wge
### Title: Kalman filter for simple signal plus noise model with missing
###   data
### Aliases: kalman.miss.wge
### Keywords: Kalman filter predicting filtering smoothing missing

### ** Examples

data(table10.1.signal)
data(table10.1.noise)
spn=table10.1.signal+table10.1.noise
n=75
Gtmiss=array(1,dim=c(1,1,n))
Gtmiss[1,1,2]=0
Gtmiss[1,1,5]=0
kalman.miss.wge(y=spn,start=0,gam0=1,F=.9,gamV=1,Gtmiss,gamW=.75)



