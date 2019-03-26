library(kappalab)


### Name: card.game-class
### Title: Class "card.game"
### Aliases: card.game-class
### Keywords: classes

### ** Examples

## a cardinal game (which is a capacity)
mu <- card.game(c(0,rep(1,4)))

# the attributes of the object
mu@n
mu@data

## a conversion
as.game(mu)

## integral calculations 
f <- c(0.2,0.3,0.1,0.7)
Choquet.integral(mu,f)
Sugeno.integral(mu,f)
f <- c(0.2,-0.3,0.1,-0.7)
Sipos.integral(mu,f)



