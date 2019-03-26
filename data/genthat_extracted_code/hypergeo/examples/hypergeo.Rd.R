library(hypergeo)


### Name: hypergeo
### Title: The hypergeometric function
### Aliases: hypergeo
### Keywords: math

### ** Examples

#  equation 15.1.3, page 556:
f1 <- function(x){-log(1-x)/x}
f2 <- function(x){hypergeo(1,1,2,x)}
f3 <- function(x){hypergeo(1,1,2,x,tol=1e-10)}
x <- seq(from = -0.6,to=0.6,len=14)
f1(x)-f2(x)
f1(x)-f3(x)  # Note tighter tolerance

# equation 15.1.7, p556:
g1 <- function(x){log(x + sqrt(1+x^2))/x}
g2 <- function(x){hypergeo(1/2,1/2,3/2,-x^2)}
g1(x)-g2(x)  # should be small 
abs(g1(x+0.1i) - g2(x+0.1i))  # should have small modulus.

# Just a random call, verified by Maple [ Hypergeom([],[1.22],0.9087) ]:
genhypergeo(NULL,1.22,0.9087)


# Little test of vectorization (warning: inefficient):
hypergeo(A=1.2+matrix(1:10,2,5)/10, B=1.4, C=1.665, z=1+2i)


# following calls test for former bugs:
hypergeo(1,2.1,4.1,1+0.1i)
hypergeo(1.1,5,2.1,1+0.1i)
hypergeo(1.9, 2.9, 1.9+2.9+4,1+0.99i) # c=a+b+4; hypergeo_cover1()





