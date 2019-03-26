library(simecol)


### Name: conway
### Title: The Classical Coway's Game of Life
### Aliases: conway
### Keywords: datasets

### ** Examples

##============================================
## Basic Usage:
##   explore the example
##============================================
data(conway)
plot(sim(conway))

## more interesting start conditions
m <- matrix(0, 40, 40)
m[5:35, 19:21] <- 1
init(conway) <- m
plot(sim(conway), col=c("white", "green"), axes = FALSE)

## change survival rules
parms(conway) <- list(srv = c(3,4), gen = c(3, 4))
plot(sim(conway), col = c("white", "green"), axes = FALSE)
## Not run: 
##D require("tcltk")
##D init(conway) <- matrix(0, 10, 10)
##D conway <- editInit(conway) # enter some "1"
##D sim(conway, animate = TRUE, delay = 100)
##D 
##D ##============================================
##D ## Implementation:
##D ##   The code of Conways Game of Life
##D ##============================================
##D conway <- new("gridModel",
##D   main = function(time, init, parms) {
##D     x      <- init
##D     nb     <- eightneighbours(x)
##D     surviv <- (x >  0 & (nb %in% parms$srv))
##D     gener  <- (x == 0 & (nb %in% parms$gen))
##D     x      <- (surviv + gener) > 0
##D     return(x)
##D   },
##D   parms  = list(srv = c(2, 3), gen = 3),
##D   times  = 1:17,
##D   init   = matrix(round(runif(1000)), ncol = 40),
##D   solver = "iteration"
##D )
## End(Not run)



