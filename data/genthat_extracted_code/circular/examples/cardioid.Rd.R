library(circular)


### Name: Cardioid
### Title: Cardioid Density Function
### Aliases: dcardioid rcardioid
### Keywords: distribution

### ** Examples

  set.seed(1234) 
  resrad <- rcardioid(n=10)
  set.seed(1234)
  resdeg <- rcardioid(n=10, control.circular=list(units="radians", zero=pi))  
  max(abs(resrad - conversion.circular(resdeg, zero=0)))



