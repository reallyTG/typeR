library(fda)


### Name: fourier
### Title: Fourier Basis Function Values
### Aliases: fourier
### Keywords: smooth

### ** Examples


#  set up a set of 11 argument values
x <- seq(0,1,0.1)
names(x) <- paste("x", 0:10, sep="")
#  compute values for five Fourier basis functions
#  with the default period (1) and derivative (0)
(basismat <- fourier(x, 5))

# Create a false Fourier basis, i.e., nbasis = 1
# = a constant function
fourier(x, 1)




