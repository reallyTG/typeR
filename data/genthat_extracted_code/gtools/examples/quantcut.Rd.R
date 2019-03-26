library(gtools)


### Name: quantcut
### Title: Create a Factor Variable Using the Quantiles of a Continuous
###   Variable
### Aliases: quantcut
### Keywords: manip

### ** Examples


  ## create example data
  ## Don't show: 
  set.seed(1234)
  
## End(Don't show)
  x <- rnorm(1000)

  ## cut into quartiles
  quartiles <- quantcut( x )
  table(quartiles)

  ## cut into deciles
  deciles.1 <- quantcut( x, 10 )
  table(deciles.1)
  # or equivalently
  deciles.2 <- quantcut( x, seq(0,1,by=0.1) )

  ## Don't show: 
    stopifnot(identical(deciles.1, deciles.2))
  
## End(Don't show)

  ## show handling of 'tied' quantiles.
  x <- round(x)  # discretize to create ties
  stem(x)        # display the ties
  deciles <- quantcut( x, 10 )

  table(deciles) # note that there are only 5 groups (not 10)
                 # due to duplicates




