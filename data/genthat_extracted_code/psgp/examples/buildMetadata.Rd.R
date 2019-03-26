library(psgp)


### Name: buildMetadata
### Title: Build Metadata Table
### Aliases: buildMetadata
### Keywords: spatial

### ** Examples

  ## Load our favourite dataset
  data(meuse)
  obs <- meuse
  
  ## Number of observations
  nobs <- length(obs$y)
  
  ## Indicate which likelihood model should be used for each observation
  obs$oeid  <- seq(1:nobs)
  
  ## Use random variances for the sake of the example
  obs$oevar <- rnorm( max(obs$oeid) )
  
  ## Generate metadata table and print it out
  metadata <- buildMetadata(obs)
  print(metadata)



