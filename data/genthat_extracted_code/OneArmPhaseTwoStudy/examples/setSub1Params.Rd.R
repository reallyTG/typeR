library(OneArmPhaseTwoStudy)


### Name: setSub1Params
### Title: Sets the parameters for a given "sub1"-object.
### Aliases: setSub1Params

### ** Examples

#Create "sub1"-object.
sub1 <- setupSub1Design()
#Change parameters.
setSub1Params(sub1, beta = 0.2, pc0 = 0.5, pt0 = 0.6)
#Calculate designs for the given "sub1"-object.
designs <- getSolutionsSub1(sub1)$Solutions
designs



