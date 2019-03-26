library(OneArmPhaseTwoStudy)


### Name: setSimonParams
### Title: Sets the parameters for a given "simon"-object.
### Aliases: setSimonParams

### ** Examples

#Create "simon"-object.
simon <- setupSimon()
#Change parameters.
setSimonParams(simon, alpha = 0.1, beta = 0.2, p0 = 0.25, p1 = 0.45)
#Calculate designs for the given "simon"-object.
designs <- getSolutions(simon)$Solutions
designs



