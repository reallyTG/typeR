library(lorentz)


### Name: gyr
### Title: Gyr function
### Aliases: gyr gyr.a gyrfun gyrfun

### ** Examples



u <- r3vel(10)
v <- r3vel(10)
w <- r3vel(10)

x <- as.3vel(c(0.4,0.1,-0.5))
y <- as.3vel(c(0.1,0.2,-0.7))
z <- as.3vel(c(0.2,0.3,-0.1))


gyr(u,v,x)  # gyr[u,v]x

f <- gyrfun(u,v)
g <- gyrfun(v,u)

f(x)
f(r3vel(10))

f(g(x)) - x              # zero, by eqn 9
g(f(x)) - x              # zero, by eqn 9
(x+y) - f(y+x)           # zero by eqn 10
(u+(v+w)) - ((u+v)+f(w)) # zero by eqn 11


# Following taken from Sbitneva 2001:

rbind(x+(y+(x+z))  ,   (x+(y+x))+z)   # left Bol property
rbind((x+y)+(x+y)  ,   x+(y+(y+x)))   # left Bruck property


sol(299792458)   # speed of light in SI
as.3vel(c(1000,3000,1000)) + as.3vel(c(1000,3000,1000))
## should be close to Galilean result

sol(1)   # revert to default c=1




