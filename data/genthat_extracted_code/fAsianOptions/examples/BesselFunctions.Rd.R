library(fAsianOptions)


### Name: BesselFunctions
### Title: Modified Bessel Functions
### Aliases: BesselFunctions BesselI BesselK BesselDI BesselDK
### Keywords: math

### ** Examples

## Bessel I0 and K0 - 
   # Abramowitz-Stegun: Table 9.8, p. 416-422
   x = c(0.0, 0.01, 0.1, 0.2, 0.5, 1, 2, 5, 10, 20, 50)  
   data.frame(x, I = exp(-x)*BesselI(x, 0), K = exp(x)*BesselK(x, 0)) 
   # Compare with R's internal function:
   # data.frame(x, ratio = BesselI(x, 0) / besselI(x, 0))
   # data.frame(x, ratio = BesselK(x, 0) / besselK(x, 0))
   
## x = 0:
   c(BesselI(0, 0), BesselI(0, 1), BesselI(0, 2), BesselI(0, 5))
   # Compare with R's internal function:
   # c(besselI(0, 0), besselI(0, 1), besselI(0, 2), besselI(0, 5))
   c(BesselK(0, 0), BesselK(0, 1), BesselK(0, 2), BesselK(0, 5))
   # Compare with R's internal function:
   # c(besselK(0, 0), besselK(0, 1), besselK(0, 2), besselK(0, 5))
   
## Bessel I2 and K2 - 
   # Abramowitz-Stegun: Table 9.8, p. 416-422
   x = c(0.0, 0.01, 0.1, 0.2, 0.5, 1, 2, 5, 10, 20, 50)  
   data.frame(x, I = BesselI(x, 2)/x^2, K = BesselK(x, 2)*x^2) 
   # Compare with R's internal function:
   # data.frame(x, ratio = BesselI(x, 0) / besselI(x, 0))
   # data.frame(x, ratio = BesselK(x, 0) / besselK(x, 0))
   # data.frame(x, ratio = BesselI(x, 1) / besselI(x, 1))
   # data.frame(x, ratio = BesselK(x, 1) / besselK(x, 1))
   # data.frame(x, ratio = BesselI(x, 5) / besselI(x, 5))
   # data.frame(x, ratio = BesselK(x, 5) / besselK(x, 5))
   # data.frame(x, ratio = BesselI(x,50) / besselI(x,50))
   # data.frame(x, ratio = BesselK(x,50) / besselK(x,50))



