library(ltsa)


### Name: DLSimulate
### Title: Simulate linear time series
### Aliases: DLSimulate
### Keywords: ts datagen

### ** Examples

#Simulate hyperbolic decay time series 
#with Hurst coefficient, H=0.9
n<-2000
H<-0.9
alpha<-2*(1-H)  #hyperbolic decay parameter
r<-(1/(1:n))^alpha
z<-DLSimulate(n, r)
plot.ts(z)
#can use HurstK function in FGN library to estimate H




