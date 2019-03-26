library(onion)


### Name: onion-package
### Title: Manipulation of quaternions and octonions
### Aliases: onion-package onion
### Keywords: package

### ** Examples


as.quaternion(1:10)  # quaternionic vector with zero imaginary components

1:10 + Hj  # Simple nontrivial quaternion; note appropriate behaviour of '+'

1:10 + Oil   # simple octonionic vector ('Oil' is one of the octonionic bases). 

a <- rquat(5) 
b <- rquat(5)  #Quaternionic vectors with random integer components

a*b - b*a     # Nonzero!  (quaternions are not commutative)

Re(a)  #  Re() extracts the real component

i(a) <- 1000 ; a  # individual components may be manipulated intuitively

as.octonion(a)  # 'upgrades' to octonion

x <- roct(5)  # random octonionic vector with integer components
y <- roct(5)
z <- roct(5)

(x*y)*z - z*(y*z)  # Nonzero!  (octonions are not associative)

Norm(x)
Mod(x)  # Modulus and Norm work as expected

# Now some plotting:

a <- as.octonion(c(7,8,3,3,7,1,3,3),single=TRUE)
b <- as.octonion(c(8,4,2,8,3,7,3,7),single=TRUE)
plot(exp(seq(from=a,to=b,len=50)))
# Note operation of seq(), exp(), and plot()



