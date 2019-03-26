library(pracma)


### Name: invlap
### Title: Inverse Laplacian
### Aliases: invlap
### Keywords: timeseries

### ** Examples

Fs <- function(s) 1/(s^2 + 1)           # sine function
Li <- invlap(Fs, 0, 2*pi, 100)

## Not run: 
##D plot(Li[[1]], Li[[2]], type = "l", col = "blue"); grid()
##D 
##D Fs <- function(s) tanh(s)/s             # step function
##D L1 <- invlap(Fs, 0.01, 20, 1000)
##D plot(L1[[1]], L1[[2]], type = "l", col = "blue")
##D L2 <- invlap(Fs, 0.01, 20, 2000, 6, 280, 59)
##D lines(L2[[1]], L2[[2]], col="darkred"); grid()
##D 
##D Fs <- function(s) 1/(sqrt(s)*s)
##D L1 <- invlap(Fs, 0.01, 5, 200, 6, 40, 20)
##D plot(L1[[1]], L1[[2]], type = "l", col = "blue"); grid()
##D 
##D Fs <- function(s) 1/(s^2 - 1)           # hyperbolic sine function
##D Li <- invlap(Fs, 0, 2*pi, 100)
##D plot(Li[[1]], Li[[2]], type = "l", col = "blue"); grid()
##D 
##D Fs <- function(s) 1/s/(s + 1)           # exponential approach
##D Li <- invlap(Fs, 0, 2*pi, 100)
##D plot(Li[[1]], Li[[2]], type = "l", col = "blue"); grid()
##D 
##D gamma <- 0.577215664901532              # Euler-Mascheroni constant
##D Fs <- function(s) -1/s * (log(s)+gamma) # natural logarithm
##D Li <- invlap(Fs, 0, 2*pi, 100)
##D plot(Li[[1]], Li[[2]], type = "l", col = "blue"); grid()
##D 
##D Fs <- function(s) (20.5+3.7343*s^1.15)/(21.5+3.7343*s^1.15+0.8*s^2.2+0.5*s^0.9)/s
##D L1 <- invlap(Fs, 0.01, 5, 200, 6, 40, 20)
##D plot(L1[[1]], L1[[2]], type = "l", col = "blue")
##D grid()
## End(Not run)



