library(SubTite)


### Name: GetPriorMeans
### Title: Calibrates prior means for Dose Finding Trial
### Aliases: GetPriorMeans

### ** Examples

##Specify elicited reference toxicity probabilities
Clinician = matrix(c(.2,.3,.4,.5,.6,.1,.2,.3,.4,.5,.05,.1,.15,.2,.3),byrow=TRUE,nrow=3)
Dose=sort(rnorm(5))
GetPriorMeans(Clinician,Dose)



