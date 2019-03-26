library(ptest)


### Name: simHReg
### Title: Simulate harmonic regression models
### Aliases: simHReg
### Keywords: ts

### ** Examples

#Simulate the harmonic regression model with standard Gaussian error terms
z <- simHReg(10, f=2/10, 1, 2, model="Gaussian",sig=1) #Fourier Frequency
plot(1:10,z,type="b")

#Simulate the AR(1) errors
z <- simHReg(10, f=0/10, 0,0, model="AR1",phi=0.2,sig=1) 
acf(z)




