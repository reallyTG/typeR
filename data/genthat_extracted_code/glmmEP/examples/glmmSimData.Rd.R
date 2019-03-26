library(glmmEP)


### Name: glmmSimData
### Title: Simulation of data from a generalized linear mixed model.
### Aliases: glmmSimData

### ** Examples

# Obtain simulated data corresponding to the simulation study in Section 4.1.2. of 
# Hall et al. (2018):

library(glmmEP)
dataObj <- glmmSimData(seed=54321)
print(names(dataObj))



