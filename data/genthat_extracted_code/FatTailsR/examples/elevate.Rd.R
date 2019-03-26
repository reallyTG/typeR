library(FatTailsR)


### Name: elevate
### Title: Elevate
### Aliases: elevate

### ** Examples

   
require(graphics)

X <- (-50:100)/5
plot( X, elevate(X, e = 5), type = "l", ylim = c(0, 20) )
lines(X, elevate(X, e = 2),   col = 2)
lines(X, elevate(X, e = 1),   col = 3)
lines(X, elevate(X, e = 0.5), col = 4)
lines(X, elevate(X, e = 0),   col = 1)




