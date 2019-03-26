library(sae)


### Name: mseFH
### Title: Mean squared error estimator of the EBLUP under a Fay-Herriot
###   model.
### Aliases: mseFH
### Keywords: method

### ** Examples

# Load data set  
data(milk)   
attach(milk)

# Fit Fay-Herriot model using ML method with indicators 
# of 4 Major Areas as explanatory variables and compute
# estimated MSEs of EB estimators
resultML <- mseFH(yi ~ as.factor(MajorArea), SD^2, method="ML")
resultML

# Fit Fay-Herriot model using REML method and compute 
# estimated MSEs of EB estimators
resultREML <- mseFH(yi ~ as.factor(MajorArea), SD^2)
resultREML

# Fit Fay-Herriot model using FH method and compute 
# estimated MSEs of EB estimators
resultFH <- mseFH(yi ~ as.factor(MajorArea), SD^2, method="FH")
resultFH

detach(milk)



