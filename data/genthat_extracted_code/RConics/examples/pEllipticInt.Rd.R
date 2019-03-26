library(RConics)


### Name: pEllipticInt
### Title: Partial elliptic integral
### Aliases: pEllipticInt

### ** Examples

# Ellipse with semi-axes: a = 5, b= 2
saxes <- c(5,2)

# 1 iteration
pEllipticInt(3,saxes,n=1)
# 5 iterations
pEllipticInt(3,saxes,n=5)
# 10 iterations
pEllipticInt(3,saxes,n=10)



