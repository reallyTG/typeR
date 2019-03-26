library(contfrac)


### Name: CF
### Title: Continued fraction convergents
### Aliases: CF GCF
### Keywords: math

### ** Examples


phi <- (sqrt(5)+1)/2
phi_cf <- CF(rep(1,100))     # phi = [1;1,1,1,1,1,...]
phi - phi_cf     # should be small

# The tan function:
"tan_cf" <- function(z,n=20){
     GCF(c(z, rep(-z^2,n-1)), seq(from=1,by=2, len=n))
}

z <- 1+1i
tan(z) - tan_cf(z)   # should be small

# approximate real numbers with continued fraction:
as_cf(pi)

as_cf(exp(1),25)    # OK up to element 21 (which should be 14)

  # Some convergents of pi:
  jj <- convergents(c(3,7,15,1,292))
  jj$A / jj$B - pi


  # An identity of Euler's:
  jj <- GCF(a=seq(from=2,by=2,len=30), b=seq(from=3,by=2,len=30), b0=1) 
  jj - 1/(exp(0.5)-1)   # should be small




