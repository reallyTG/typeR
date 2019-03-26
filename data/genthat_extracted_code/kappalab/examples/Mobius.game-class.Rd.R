library(kappalab)


### Name: Mobius.game-class
### Title: Class "Mobius.game"
### Aliases: Mobius.game-class
### Keywords: classes

### ** Examples

## a game (which is a capacity)
mu <- game(c(0,rep(1,15)))
## and its Mobius representation
a <- Mobius(mu)

# the attributes of object a
a@n
a@k
a@data
a@subsets

## a transformation
zeta(a)
## let us check ...
Mobius(zeta(a))

## integral calculations 
f <- c(0.2,0.3,0.1,0.7)
Choquet.integral(a,f)
Sugeno.integral(a,f)
f <- c(0.2,-0.3,0.1,-0.7)
Sipos.integral(a,f)



