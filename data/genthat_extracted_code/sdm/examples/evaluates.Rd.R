library(sdm)


### Name: evaluates
### Title: evaluate for accuracy
### Aliases: evaluates getEvaluation evaluates,vector,vector-method
###   getEvaluation,sdmModels-method
### Keywords: spatial,species,data

### ** Examples

## Not run: 
##D file <- system.file("external/model.sdm", package="sdm")
##D 
##D m <- read.sdm(file) # a sdmModels Object (fitted using sdm function)
##D 
##D getModelInfo(m)
##D 
##D # there are 4 models in the sdmModels objects
##D 
##D # so let's take a look  at all the results for the model with modelID 1
##D 
##D # evaluation using training data (both threshod_independent and threshold_based groups):
##D 
##D getEvaluation(m,w=1,wtest='training') 
##D 
##D getEvaluation(m,w=1,wtest='training',stat=1) # stat=1 (threshold_independent)
##D 
##D getEvaluation(m,w=1,wtest='test.dep',stat=2) # stat=2 (threshold_based)
##D 
##D getEvaluation(m,w=1:3,wtest='test.dep',stat=c('AUC','TSS'),opt=2) 
##D 
##D getEvaluation(m,opt=1) # all models
##D 
##D getEvaluation(m,stat=c('TSS','Kappa','AUC'),opt=1) # all models
##D 
##D 
##D ############
##D 
##D example for evaluation:
##D 
##D evaluates(x=c(1,1,0,1,0,0,0,1,1,1,0),
##D           p=c(0.69,0.04,0.05,0.95,0.04,0.65,0.09,0.61,0.75,0.84,0.15))
##D 
## End(Not run)



