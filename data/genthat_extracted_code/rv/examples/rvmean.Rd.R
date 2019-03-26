library(rv)


### Name: rvmean
### Title: Expectation of a Random Variable
### Aliases: rvmean E Pr
### Keywords: classes

### ** Examples


  x <- rvnorm(mean=(1:10)/5, sd=1)
  rvmean(x)  # means of the 10 components
  E(x)       # same as rvmean(x)
  Pr(x>1)    # probabilities that each component is >1.




