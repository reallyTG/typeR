library(fAsianOptions)


### Name: GammaFunctions
### Title: Gamma and Related Functions
### Aliases: GammaFunctions erf Psi igamma cgamma Pochhammer
### Keywords: math

### ** Examples

## Calculate Error, Gamma and Related Functions

## gamma -
   # Abramowitz-Stegun: Figure 6.1
   x = seq(-4.01, 4.01, by = 0.011)
   plot(x, gamma(x), ylim = c(-5,5), type = "l", main = "Gamma Function")
   lines(x = c(-4, 4), y = c(0, 0))
     
## Psi -
   # Abramowitz-Stegun: Figure 6.1
   x = seq(-4.01, 4.01, by = 0.011)
   plot(x, Psi(x), ylim = c(-5, 5), type = "l", main = "Psi Function")
   lines(x = c(-4, 4), y = c(0, 0))
   # Note: Is digamma defined for positive values only ?

## igamma -
   # Abramowitz-Stegun: Figure 6.3. 
   gammaStar = function(x, a) { igamma(x,a)/x^a }
   # ... create Figure as an exercise.
  
## igamma -
   # Abramowitz-Stegun: Formula 6.5.12
   # Relation to Confluent Hypergeometric Functions
   a = sqrt(2)
   x = pi
   Re ( (x^a/a) * kummerM(-x, a, 1+a) )
   Re ( (x^a*exp(-x)/a) * kummerM(x, 1, 1+a) )
   pgamma(x,a) * gamma(a)
   igamma(x, a)
 
## cgamma -
   # Abramowitz-Stegun: Tables 6.7
   x = 1
   y = seq(0, 5, by = 0.1); x = rep(x, length = length(y))
   z = complex(real = x, imag = y)
   c = cgamma(z, log = TRUE)
   cbind(y, Re(c), Im(c))
    
## cgamma -
   # Abramowitz-Stegun: Examples 4-8:
   options(digits = 10)
   gamma(6.38); lgamma(56.38)                            # 1/2
   Psi(6.38); Psi(56.38)                                 # 3/4
   cgamma(complex(real = 1, imag = -1), log = TRUE )     # 5
   cgamma(complex(real = 1/2, imag = 1/2), log = TRUE )  # 6
   cgamma(complex(real = 3, imag = 7), log = TRUE )      # 7/8 



