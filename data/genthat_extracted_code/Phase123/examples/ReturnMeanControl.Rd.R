library(Phase123)


### Name: ReturnMeanControl
### Title: Gives true mean survival times for the control therapy.
### Aliases: ReturnMeanControl

### ** Examples

###Family of Distributions
Family="Gamma"
###Shape parameter
alpha=2
##True beta vector for efficacy, toxicity and intercept of the control treatment
betaC=c(.3,-.25,2.389)
##True efficacy and toxicity probability for control group
ProbC = c(.4,.15)
ReturnMeanControl(ProbC,betaC,Family,alpha)



