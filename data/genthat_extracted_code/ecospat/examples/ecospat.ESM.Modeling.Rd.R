library(ecospat)


### Name: ecospat.ESM.Modeling
### Title: Ensamble of Small Models: Calibration of Simple Bivariate Models
### Aliases: ecospat.ESM.Modeling

### ** Examples

   ## Not run: 
##D library(biomod2)
##D 
##D # Loading test data
##D data(ecospat.testNiche.inv)
##D inv <- ecospat.testNiche.inv
##D 
##D # species occurrences
##D xy <- inv[,1:2]
##D sp_occ <- inv[11]
##D 
##D # env
##D current <- inv[3:10]
##D 
##D 
##D 
##D ### Formating the data with the BIOMOD_FormatingData() function from the package biomod2
##D 
##D sp <- 1
##D myBiomodData <- BIOMOD_FormatingData( resp.var = as.numeric(sp_occ[,sp]),
##D                                       expl.var = current,
##D                                       resp.xy = xy,
##D                                       resp.name = colnames(sp_occ)[sp])
##D 
##D 
##D ### Calibration of simple bivariate models
##D my.ESM <- ecospat.ESM.Modeling( data=myBiomodData,
##D                                 models=c('GLM','RF'),
##D                                 NbRunEval=2,
##D                                 DataSplit=70,
##D                                 weighting.score=c("AUC"),
##D                                 parallel=FALSE)  
##D 
##D 
##D ### Evaluation and average of simple bivariate models to ESMs
##D my.ESM_EF <- ecospat.ESM.EnsembleModeling(my.ESM,weighting.score=c("SomersD"),threshold=0)
##D 
##D ### Projection of simple bivariate models into new space 
##D my.ESM_proj_current<-ecospat.ESM.Projection(ESM.modeling.output=my.ESM,
##D                                             new.env=current)
##D 
##D ### Projection of calibrated ESMs into new space 
##D my.ESM_EFproj_current <- ecospat.ESM.EnsembleProjection(ESM.prediction.output=my.ESM_proj_current,
##D                                                         ESM.EnsembleModeling.output=my.ESM_EF)
##D 
##D ## get the model performance of ESMs 
##D my.ESM_EF$ESM.evaluations
##D ## get the weights of the single bivariate models used to build the ESMs
##D my.ESM_EF$weights
##D 
##D ## get the variable contributions of ESMs
##D ecospat.ESM.VarContrib(my.ESM,my.ESM_EF,scaling="01")
## End(Not run)


