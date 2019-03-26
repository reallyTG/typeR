library(randtoolbox)


### Name: rngWELLScriptR
### Title: An implementation of the recurrence of WELL generators in R
###   language
### Aliases: rngWELLScriptR

### ** Examples

  set.generator("WELL", order=512, version="a", seed=123456)
  s <- getWELLState()
  x <- runif(500)
  y <- rngWELLScriptR(500, s, "512a")
  all(x == y)
  # [1] TRUE



