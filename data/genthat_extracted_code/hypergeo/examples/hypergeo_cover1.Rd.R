library(hypergeo)


### Name: hypergeo_cover1
### Title: Hypergeometric functions for special values of the parameters
### Aliases: hypergeo_cover1 hypergeo_cover2 hypergeo_cover3
### Keywords: math

### ** Examples



# Test hypergeo_cover1():
jjR <- hypergeo(pi,pi/2,3*pi/2-4, z=0.1+0.2i)
jjM <- 0.53745229690249593045 + 1.8917456473240515664i


# Test hypergeo_cover2():
jjM <- -0.15888831928748121465e-5 + 0.40339599711492215912e-4i
jjR <- hypergeo(pi,pi+2, 1.1 , 1+10i)  # This is 15.3.13
stopifnot(Mod(jjR-jjM)<1e-10)


# Test hypergeo_cover3()
jjM <- -0.24397135980533720308e-1 + 0.28819643319432922231i
jjR <- hypergeo(pi, 1.4, pi+4, 1+6i)
stopifnot(Mod(jjR-jjM)<1e-10)




