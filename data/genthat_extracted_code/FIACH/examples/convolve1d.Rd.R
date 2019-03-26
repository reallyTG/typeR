library(FIACH)


### Name: convolve1d
### Title: Finite Impulse Response filter
### Aliases: convolve1d

### ** Examples

## 1.  construct a sinusoid oscillating at .03Hz for 600s with a TR of 2.16s  
## 2. add a sinusoid oscillating at .15Hz for 600s with a TR of 2.16s
## 3. make large matrix of signals

test<-sin(2*pi*.03*(seq(0,600,2.16)))                                   
test.noise<-test+sin(2*pi*.15*(seq(0,600,2.16)))                      
test.mat<-matrix(test.noise,nrow=length(test.noise),ncol=5)        

## compute an impulse response. In this case a kaiser window
kais<-kaiserWin(fl=.08,tw=.025,sf=1/2.16,d.sa=70,d.pbr=.1,type="low") 
system.time(filt<-convolve1d(test.mat,kais,subtractMed=TRUE)) 
par(mfrow=c(3,1))                                                    
ts.plot(test,ylim=c(-2,2))                                              
ts.plot(test.mat[,1],ylim=c(-2,2))                                 
ts.plot(filt[,1],ylim=c(-2,2))                        




