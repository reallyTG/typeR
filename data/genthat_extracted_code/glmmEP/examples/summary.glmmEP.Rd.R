library(glmmEP)


### Name: summary.glmmEP
### Title: Inferential summary for a generalized linear mixed model with
###   expectation propagation fitting.
### Aliases: summary.glmmEP

### ** Examples

dataObj <- glmmSimData(seed=54321)
y <- dataObj$y  
Xfixed <- dataObj$Xfixed
Xrandom <- dataObj$Xrandom  
idNum <- dataObj$idNum
## No test: 
fitSimData <- glmmEP(y,Xfixed,Xrandom,idNum)
summary(fitSimData)
## End(No test)



