library(fOptions)


### Name: LowDiscrepancy
### Title: Low Discrepancy Sequences
### Aliases: LowDiscrepancy runif.halton rnorm.halton runif.sobol
###   rnorm.sobol runif.pseudo rnorm.pseudo
### Keywords: programming

### ** Examples

## *.halton - 
   par(mfrow = c(2, 2), cex = 0.75)
   runif.halton(n = 10, dimension = 5)
   hist(runif.halton(n = 5000, dimension = 1), main = "Uniform Halton", 
     xlab = "x", col = "steelblue3", border = "white")
   rnorm.halton(n = 10, dimension = 5)
   hist(rnorm.halton(n = 5000, dimension = 1), main = "Normal Halton", 
     xlab = "x", col = "steelblue3", border = "white")
   
## *.sobol - 
   runif.sobol(n = 10, dimension = 5, scrambling = 3)
   hist(runif.sobol(5000, 1, scrambling = 2), main = "Uniform Sobol", 
     xlab = "x", col = "steelblue3", border = "white")
   rnorm.sobol(n = 10, dimension = 5, scrambling = 3)
   hist(rnorm.sobol(5000, 1, scrambling = 2), main = "Normal Sobol", 
     xlab = "x", col = "steelblue3", border = "white")
   
## *.pseudo - 
   runif.pseudo(n = 10, dimension = 5)
   rnorm.pseudo(n = 10, dimension = 5) 



