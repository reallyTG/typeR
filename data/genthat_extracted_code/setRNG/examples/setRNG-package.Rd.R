library(setRNG)


### Name: setRNG-package
### Title: setRNG
### Aliases: setRNG-package setRNG.Intro
### Keywords: programming interface utilities distribution

### ** Examples

setRNG(kind="Wichmann-Hill", seed=c(979,1479,1542), normal.kind="Box-Muller")
rnorm(10)

sim <-function(rng=NULL)
 {if(!require("setRNG")) stop("This function requires the setRNG package.")
  if(is.null(rng)) rng <- setRNG() # returns setting so don't skip if NULL
  else        {old.rng <- setRNG(rng);  on.exit(setRNG(old.rng))  }
  x <- list(numbers=rnorm(10))
  x$rng <- rng
  x
 }

z <- sim()
sim()$numbers
sim(rng=getRNG(z))$numbers
z$numbers




