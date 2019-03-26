library(glmmEP)


### Name: glmmEP.control
### Title: Controlling generalized linear mixed model fitting via
###   expectation propagation
### Aliases: glmmEP.control

### ** Examples

library(glmmEP)

# Obtain simulated data corresponding to the simulation study in Section 4.1.2. of 
# Hall et al. (2018):

dataObj <- glmmSimData(seed=54321)
y <- dataObj$y  
Xfixed <- dataObj$Xfixed
Xrandom <- dataObj$Xrandom  
idNum <- dataObj$idNum

# Obtain and summarise probit mixed model fit with user control
# of some of the parameters in glmmEP.control():

myNMmaxit <- 500 ; myBFGSreltol <- 0.001
## No test: 
fitSimData <- glmmEP(y,Xfixed,Xrandom,idNum,
              control=glmmEP.control(NMmaxit=myNMmaxit,BFGSreltol=myBFGSreltol,quiet=TRUE))
summary(fitSimData)
## End(No test)



