library(TeachingSampling)


### Name: OrderWR
### Title: Pseudo-Support for Fixed Size With Replacement Sampling Designs
### Aliases: OrderWR
### Keywords: survey

### ** Examples

# Vector U contains the label of a population
U <- c("Yves", "Ken", "Erik", "Sharon", "Leslie")
N <- length(U)
# Under this context, there are five (5) possible ordered samples
OrderWR(N,1)
# The same output, but labeled
OrderWR(N,1,ID=U)
# y is the variable of interest
y<-c(32,34,46,89,35)
OrderWR(N,1,ID=y)

# If the smaple size is m=2, there are (25) possible ordered samples
OrderWR(N,2)
# The same output, but labeled
OrderWR(N,2,ID=U)
# y is the variable of interest
y<-c(32,34,46,89,35)
OrderWR(N,2,ID=y)

# Note that the number of ordered samples is not equal to the number of 
# samples in a well defined with-replacement support 
OrderWR(N,2)
SupportWR(N,2)

OrderWR(N,4)
SupportWR(N,4)



