library(microsamplingDesign)


### Name: getIndividualParameters
### Title: sample subject specific parameters to input in pharmacodynamic
###   model paramaters are sample from a log-normal distribution
### Aliases: getIndividualParameters

### ** Examples

  parameters              <-  c( 1 , 0.1 , 10 , 3 )
  names( parameters )     <-  c( "Ka", "Ke" , "volume" , "dose" ) 
  coeffVariation          <-  c( 0.05 , 0.05 , 0.05, 0 )
  names(coeffVariation)   <-  names( parameters )
  nSubjects               <-  9

  # example correlation matrix 
  corrMatrix              <-  matrix(0.2 , nrow = 4 , ncol = 4) +
     diag( rep( 0.8 , 4 ) ) # correlation on the the log scale
  
  # assuming independence between parameters
  getIndividualParameters( parameters , coeffVariation ,  nSubjects = 9 )
  
  # assuming correlations between parameters 
  getIndividualParameters( parameters , coeffVariation ,  nSubjects = 9 , corrMatrix)
  getIndividualParameters( meanParam = parameters , coeffVariation ,  nSubjects = 3 , corrMatrix)





