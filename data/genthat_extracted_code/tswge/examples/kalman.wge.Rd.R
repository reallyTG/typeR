library(tswge)


### Name: kalman.wge
### Title: Kalman filter for simple signal plus noise model
### Aliases: kalman.wge
### Keywords: Kalman filter predicting filtering smoothing

### ** Examples

data(table10.1.signal)
data(table10.1.noise)
spn=table10.1.signal+table10.1.noise
kalman.wge(y=spn,start=0,gam0=1,F=.9,gamV=1,G=1,gamW=.75)



