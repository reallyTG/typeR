library(TIMP)


### Name: dat-class
### Title: Class "dat" for model and data storage
### Aliases: dat-class dat
### Keywords: classes

### ** Examples

# simulate data 

 C <- matrix(nrow = 51, ncol = 2)
 k <- c(.5, 1)
 t <- seq(0, 2, by = 2/50)
 C[, 1] <- exp( - k[1] * t)
 C[, 2] <- exp( - k[2] * t) 
 E <- matrix(nrow = 51, ncol = 2)
 wavenum <- seq(18000, 28000, by=200)
 location <- c(25000, 20000)
 delta <- c(5000, 7000)
 amp <- c(1, 2)
 E[, 1] <- amp[1] * exp( - log(2) * (2 * (wavenum - location[1])/delta[1])^2)
 E[, 2] <- amp[2] * exp( - log(2) * (2 * (wavenum - location[2])/delta[2])^2)
 sigma <- .001
 Psi_q  <- C %*% t(E) + sigma * rnorm(nrow(C) * nrow(E)) 

 # initialize an object of class dat 
 Psi_q_data <- dat(psi.df = Psi_q, x = t, nt = length(t), 
 x2 = wavenum, nl = length(wavenum))

 # initialize an object of class dat via initModel 
 # this dat object is also a kin object
 kinetic_model <- initModel(mod_type = "kin", seqmod = FALSE, 
 kinpar = c(.1, 2))



