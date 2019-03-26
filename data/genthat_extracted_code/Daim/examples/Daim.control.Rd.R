library(Daim)


### Name: Daim.control
### Title: Control parameters for the diagnostic accuracy of models.
### Aliases: Daim.control
### Keywords: classif

### ** Examples


  ###
  ### for bootstrap
  ###

  Daim.control(method="boot", number=100)

  ###
  ### for cross-validation
  ###

  Daim.control(method="cv", k=10, k.runs=10)

  ###
  ### for subagging or subsampling
  ###

  Daim.control(method="boot", number=100, replace=FALSE, boot.size=0.9)




