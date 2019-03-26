library(lorentz)


### Name: Ops.3vel
### Title: Arithmetic Ops Group Methods for 3vel objects
### Aliases: Ops.3vel Ops.gyr Ops massage3 neg3 prod3 add3 dot3 equal3

### ** Examples

u <- as.3vel(c(-0.7, 0.1,-0.1))
v <- as.3vel(c( 0.1, 0.2, 0.3))
w <- as.3vel(c( 0.5, 0.2,-0.3))

x <- r3vel(10)   # random three velocities
y <- r3vel(10)   # random three velocities


u+v   # add3(u,v)
u-v   # add3(u,neg3(v))

-v    # neg3(v)

gyr(u,v,w)

## package is vectorized:


u+x
x+y

f <- gyrfun(u,v)
g <- gyrfun(v,u)

f(g(x)) - x    # should be zero by eqn10
g(f(x)) - x


(u+v) - f(v+u)                     # zero by eqn 10
(u+(v+w)) - ((u+v)+f(w))           # zero by eqn 11
((u+v)+w) - (u+(v+g(w)))           # zero by eqn 11


## NB, R idiom is unambiguous.  But always always ALWAYS use brackets.

## Ice report in lat 42.n to 41.25n Long 49w to long 50.30w saw much
## heavy pack ice and great number large icebergs also field
## ice.  Weather good clear

## -u+v == (-u) + v == neg3(u) + v == add3(neg3(u),v)

## u+v+w == (u+v)+w == add3(add3(u,v),w)













