library(dfmeta)


### Name: glimem
### Title: The logistic regression mixed effect model.
### Aliases: glimem

### ** Examples

  ## Not run: 
##D     ################################################################
##D     ### Give a toxicity data for each simulation and each trial. ###
##D     ################################################################
##D     
##D     ### Using a toxicity data for each simulation and each trial including in the dfmeta package.
##D     data("Toxdata")
##D     dim(Toxdata)
##D     colnames(Toxdata)
##D     
##D     ## NOTE: The toxicity dataset must have the same structure as below. ##
##D     ## Check it before running the VarWT function! ##
##D     str(Toxdata)
##D     
##D     analyf0 <- Toxdata[order(Toxdata$simulation), ]
##D     
##D     ## Using the random effect analysis's function including in the dfmeta package ##
##D     simData <- doseRecords(analyf0)
##D     NewData <- simData$doseRecords
##D     
##D     ########################################################################################
##D     ## In the following example the function glimem is using to find the predicted random ##  
##D     ###################### effect center mu only for the simulation 10 #####################
##D     ########################################################################################
##D     
##D     mod <- glimem(NewData, 10, 10, family = binomial, link = "logit", nAGQ = 1, 
##D                   control = glmerControl(optimizer = "bobyqa"))
##D     mod
##D   
## End(Not run)



