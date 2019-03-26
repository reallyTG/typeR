library(hypergeo)


### Name: f15.3.1
### Title: Hypergeometric function using Euler's integral representation
### Aliases: f15.3.1 hypergeo_integral
### Keywords: math

### ** Examples



# For |z| <1 the path can be direct:
f15.3.1(2,1,2,-1/2) -2/3

# cf identity 07.23.03.0046.01 of Hypergeometric2F1.pdf with b=1




f <- function(h){f15.3.1(1,2,3, z=2, h=h)}

# Winding number [around 1/z] matters:
f(0.5)
f(c(1-1i, 1+1i, -2i))

# Accuracy isn't too bad; compare numerical to analytical result :
f(0.5) - (-1+1i*pi/2)




