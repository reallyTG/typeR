library(move)


### Name: licenseTerms
### Title: Extract the license terms of a Move or MoveStack object
### Aliases: licenseTerms licenseTerms<- licenseTerms,.MoveGeneral-method
###   licenseTerms<-,.MoveGeneral-method

### ** Examples

  data(leroy)
  licenseTerms(leroy) #get the license from a Move object
  
  ## change the license and set it for a Move object
  licenseTerms(leroy) <- "use of data only permitted after obtaining licence from the PI" 
 
  data(fishers)
  licenseTerms(fishers) #get the license from a MoveStack object
  
  ## change the license and set it for a MoveStack object
  licenseTerms(fishers) <- "use of data only permitted after obtaining licence from the PI"



