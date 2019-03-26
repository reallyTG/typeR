library(CliftLRD)


### Name: meanC
### Title: Functions to perform summary calculations of wavelet scales and
###   energies resulting from complex-valued lifting transforms.
### Aliases: meanC meanmoC
### Keywords: manip

### ** Examples


x<-rnorm(50,30,2)
y<-rnorm(50,30,2)

z<-complex(real=x,imaginary=y)

# calculate the average squared value of complex-valued vector (i.e. energy)

meanC(z)




