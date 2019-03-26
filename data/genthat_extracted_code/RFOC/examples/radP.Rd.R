library(RFOC)


### Name: radP
### Title: Radiation pattern for P waves
### Aliases: radP
### Keywords: misc

### ** Examples

phiS=65
del=25
lam=13
x = seq(-1, 1, 0.01)
y = x

X = matrix(rep(x, length(y)), nrow= length(x))
Y = t(X)
RAD2DEG = 180/pi
p = RAD2DEG*(pi/2 -atan2(Y, X))
p[p<0] = p[p<0] + 360

R = sqrt(X^2+Y^2)
R[R>1] = NaN
dip =RAD2DEG*2*asin(R/sqrt(2))

###  Calculate the radiation pattern
G = radP(del, phiS, lam, dip, p)

###  plot values
image(x,y,G, asp=1)




