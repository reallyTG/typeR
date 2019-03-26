library(randtoolbox)


### Name: quasiRNG
### Title: Toolbox for quasi random number generation
### Aliases: quasiRNG torus sobol runif.sobol halton runif.halton
###   quasi.randtoolbox
### Keywords: distribution

### ** Examples

# (1) the Torus algorithm
#
torus(100)

# example of setting the seed
setSeed(1)
torus(5)
setSeed(6)
torus(5)
#the same
setSeed(1)
torus(10)

#no use of the machine time
torus(10, use=FALSE)

#Kolmogorov Smirnov test
#KS statistic should be around 0.0019
ks.test(torus(1000), punif) 
	
#KS statistic should be around 0.0003
ks.test(torus(10000), punif) 

#the mixed Torus sequence
torus(10, mix=TRUE)
par(mfrow = c(1,2))
acf(torus(10^6))
acf(torus(10^6, mix=TRUE))

#usage of the init argument
torus(5)
torus(5, init=FALSE)

#should be equal to the combination of the two
#previous call
torus(10)

# (2) Halton sequences
#

# uniform variate
halton(n = 10, dim = 5)

# normal variate
halton(n = 10, dim = 5, normal = TRUE)

#usage of the init argument
halton(5)
halton(5, init=FALSE)

#should be equal to the combination of the two
#previous call
halton(10)

# some plots
par(mfrow = c(2, 2), cex = 0.75)
hist(halton(n = 5000, dim = 1), main = "Uniform Halton", 
  xlab = "x", col = "steelblue3", border = "white")

hist(halton(n = 5000, dim = 1, norm = TRUE), main = "Normal Halton", 
  xlab = "x", col = "steelblue3", border = "white")
   
# (3) Sobol sequences
#

# uniform variate
sobol(n = 10, dim = 5, scrambling = 3)

# normal variate
sobol(n = 10, dim = 5, scrambling = 3, normal = TRUE)

# some plots
hist(sobol(5000, 1, scrambling = 2), main = "Uniform Sobol", 
  xlab = "x", col = "steelblue3", border = "white")

hist(sobol(5000, 1, scrambling = 2, normal = TRUE), main = "Normal Sobol", 
  xlab = "x", col = "steelblue3", border = "white")

#usage of the init argument
sobol(5)
sobol(5, init=FALSE)

#should be equal to the combination of the two
#previous call
sobol(10)

# (4) computation times on my macbook, mean of 1000 runs
#

## Not run: 
##D # algorithm			time in seconds for n=10^6
##D # Torus algo					0.058 
##D # mixed Torus algo 	       			0.087 
##D # Halton sequence				0.878
##D # Sobol sequence				0.214
##D n <- 1e+06
##D mean( replicate( 1000, system.time( torus(n), gcFirst=TRUE)[3]) )
##D mean( replicate( 1000, system.time( torus(n, mixed=TRUE), gcFirst=T)[3]) )
##D mean( replicate( 1000, system.time( halton(n), gcFirst=TRUE)[3]) )
##D mean( replicate( 1000, system.time( sobol(n), gcFirst=TRUE)[3]) )
##D 	
## End(Not run)




