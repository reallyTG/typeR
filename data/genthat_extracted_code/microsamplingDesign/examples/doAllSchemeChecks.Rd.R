library(microsamplingDesign)


### Name: doAllSchemeChecks
### Title: check whether either a 1 subject or multiple subject
###   microsampling scheme meets imposed constraints
### Aliases: doAllSchemeChecks

### ** Examples

  exampleChecks    <- getConstraintsExample()
  exampleSubject1  <-  c( TRUE  , TRUE  , TRUE , FALSE , FALSE , TRUE )
  exampleSubject2  <-  c( FALSE , FALSE , TRUE , FALSE , FALSE , TRUE )
  exampleScheme    <-  rbind( exampleSubject1, exampleSubject2 ) 
  doAllSchemeChecks( exampleSubject1 , "subject" , checks = exampleChecks )
  doAllSchemeChecks( exampleSubject2 , "subject" , checks = exampleChecks )
  doAllSchemeChecks( exampleScheme , "scheme" , checks = exampleChecks )



