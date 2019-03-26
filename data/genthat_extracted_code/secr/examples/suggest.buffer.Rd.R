library(secr)


### Name: suggest.buffer
### Title: Mask Buffer Width
### Aliases: suggest.buffer bias.D
### Keywords: models

### ** Examples


## Not run: 
##D temptraps <- make.grid()
##D detpar <-  list(g0 = 0.2, sigma = 25)
##D suggest.buffer(temptraps, "halfnormal", detpar, 5)
##D 
##D RB <- bias.D(50:150, temptraps, "halfnormal", detpar, 5)
##D plot(RB)
##D 
##D detpar <-  list(g0 = 0.2, sigma = 25, z=5)
##D RB <- bias.D(50:150, temptraps, "hazard rate", detpar, 5)
##D lines(RB)
##D 
##D ## compare to esa plot
##D esa.plot (temptraps, max.buffer = 150, spacing = 4, detectfn = 0,
##D   detectpar = detpar, noccasions = 5, as.density = F)
## End(Not run)

## compare detection histories and fitted model as input
suggest.buffer(captdata)
suggest.buffer(secrdemo.0)



