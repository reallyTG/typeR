library(kappalab)


### Name: game-class
### Title: Class "game"
### Aliases: game-class
### Keywords: classes

### ** Examples

## a game (which is a capacity)
mu <- game(c(0,rep(1,15)))

## the attributes of the object
mu@n
mu@data
mu@subsets

## a conversion
as.card.game(mu)

## a transformation
Mobius(mu)
## let us check ...
zeta(Mobius(mu))

## integral calculations 
f <- c(0.2,0.3,0.1,0.7)
Choquet.integral(mu,f)
Sugeno.integral(mu,f)
f <- c(0.2,-0.3,0.1,-0.7)
Sipos.integral(mu,f)



