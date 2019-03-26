library(fAsianOptions)


### Name: HypergeometricFunctions
### Title: Confluent Hypergeometric Functions
### Aliases: HypergeometricFunctions kummerM kummerU whittakerM whittakerW
###   hermiteH
### Keywords: math

### ** Examples

## kummerM - 
   # Abramowitz-Stegun: Formula 13.6.3/13.6.21
   x = c(0.001, 0.01, 0.1, 1, 10, 100, 1000)  
   nu = 1; a = nu+1/2; b = 2*nu+1
   M = Re ( kummerM(x = 2*x, a = a, b = b) )
   Bessel = gamma(1+nu) * exp(x)*(x/2)^(-nu) * BesselI(x, nu)
   cbind(x, M, Bessel) 

## kummerM -
   # Abramowitz-Stegun: Formula 13.6.14
   x = c(0.001, 0.01, 0.1, 1, 10, 100, 1000)  
   M = Re ( kummerM(2*x, a = 1, b = 2) )
   Sinh = exp(x)*sinh(x)/(x)
   cbind(x, M, Sinh)
   # Now the same for complex x:
   y = rep(1, length = length(x))
   x = complex(real = x, imag = y)
   M = kummerM(2*x, a = 1, b = 2)
   Sinh = exp(x)*sinh(x)/(x)
   cbind(x, M, Sinh)

## kummerU -
   # Abramowitz-Stegun: Formula 13.1.3
   x = c(0.001, 0.01, 0.1, 1, 10, 100, 1000) 
   a = 1/3; b = 2/3
   U = Re ( kummerU(x, a = a, b = b) )
   cbind(x, U)
 
## whittakerM - 
   # Abramowitz-Stegun: Example 13
   AS = c(1.10622, 0.57469)
   W = c(
     whittakerM(x = 1, kappa = 0, mu = -0.4),
     whittakerW(x = 1, kappa = 0, mu = -0.4) )
   data.frame(AS, W)

## kummerM
   # Abramowitz-Stegun: Example 17
   x = seq(0, 16, length = 200)
   plot(x = x, y = kummerM(x, -4.5, 1), type = "l", ylim = c(-25,125),
     main = "Figure 13.2:  M(-4.5, 1, x)")
   lines(x = c(0, 16), y = c(0, 0), col = 2)



