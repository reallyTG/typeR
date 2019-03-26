library(spatstat)


### Name: eval.fasp
### Title: Evaluate Expression Involving Function Arrays
### Aliases: eval.fasp
### Keywords: spatial manip programming

### ** Examples

  # manipulating the K function
  K <- alltypes(amacrine, "K")

  # expressions involving a fasp object
  eval.fasp(K + 3)
  L <- eval.fasp(sqrt(K/pi))

  # expression involving two fasp objects
  D <- eval.fasp(K - L)

  # subtracting the unmarked K function from the cross-type K functions
  K0 <- Kest(unmark(amacrine))
  DK <- eval.fasp(K - K0)

  ## Use of 'envir'
  S <- eval.fasp(1-G, list(G=alltypes(amacrine, "G")))



