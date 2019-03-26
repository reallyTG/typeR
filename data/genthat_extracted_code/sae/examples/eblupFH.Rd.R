library(sae)


### Name: eblupFH
### Title: EBLUPs based on a Fay-Herriot model.
### Aliases: eblupFH
### Keywords: method

### ** Examples

# Load data set  
data(milk)   
attach(milk)

# Fit FH model using REML method with indicators of 4 Major Areas as 
# explanatory variables.
resultREML <- eblupFH(yi ~ as.factor(MajorArea), SD^2)
resultREML

#Fit FH model using FH method
resultFH <- eblupFH(yi ~ as.factor(MajorArea), SD^2, method="FH")
resultFH

detach(milk)



