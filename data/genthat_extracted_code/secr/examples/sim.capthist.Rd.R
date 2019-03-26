library(secr)


### Name: sim.capthist
### Title: Simulate Detection Histories
### Aliases: sim.capthist sim.resight
### Keywords: datagen

### ** Examples

## simple example
## detector = "multi" (default)
temptrap <- make.grid(nx = 6, ny = 6, spacing = 20)
sim.capthist (temptrap, detectpar = list(g0 = 0.2, sigma = 20))

## with detector = "proximity", there may be more than one
## detection per individual per occasion
temptrap <- make.grid(nx = 6, ny = 6, spacing = 20, detector =
    "proximity")
summary(sim.capthist (temptrap, detectpar = list(g0 = 0.2, 
    sigma = 20)))

## marking on occasions 1, 3 only
temptrap <- make.grid(nx = 6, ny = 6, spacing = 20, detector = 'proximity')
markocc(temptrap) <- c(1,0,1,0,0)
CH <- sim.resight (temptrap, detectpar = list(g0 = 0.2, sigma = 20))
summary(CH)

## multiple sessions
grid4 <- make.grid(nx = 2, ny = 2)
temp <- sim.capthist (grid4, popn = list(D = 1), nsessions = 20)
summary(temp, terse = TRUE)

## unmarked or presence types
# grid <- make.grid(nx = 10, ny = 10, detector = "unmarked")
# CH <- sim.capthist (grid, noccasions = 5)
# CH
## "presence" and "unmarked" data are stored as "count" data
## behaviour is controlled by detector type, e.g.
# detector(traps(CH)) <- "presence"
# CH





