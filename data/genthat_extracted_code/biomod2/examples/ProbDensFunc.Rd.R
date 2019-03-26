library(biomod2)


### Name: ProbDensFunc
### Title: Probability Density Function
### Aliases: ProbDensFunc
### Keywords: optimize distribution

### ** Examples


## Not run: 
##D DataSpecies <- read.csv(system.file("external/species/mammals_table.csv",
##D                                     package="biomod2"), row.names = 1)
##D head(DataSpecies)
##D 
##D # the name of studied species
##D myRespName <- 'GuloGulo'
##D 
##D # the presence/absences data for our species 
##D myResp <- as.numeric(DataSpecies[,myRespName])
##D 
##D # remove all 0 from response vector to work with
##D # presence only data (Pseudo Absences selections)
##D rm_id <- which(myResp==0)
##D myResp <- myResp[-rm_id]
##D 
##D 
##D # the XY coordinates of species data
##D myRespXY <- DataSpecies[-rm_id,c("X_WGS84","Y_WGS84")]
##D 
##D 
##D # Environmental variables extracted from BIOCLIM 
##D myExpl = stack( system.file( "external/bioclim/current/bio3.grd", 
##D                              package="biomod2"),
##D                 system.file( "external/bioclim/current/bio4.grd", 
##D                              package="biomod2"), 
##D                 system.file( "external/bioclim/current/bio7.grd", 
##D                              package="biomod2"),  
##D                 system.file( "external/bioclim/current/bio11.grd", 
##D                              package="biomod2"), 
##D                 system.file( "external/bioclim/current/bio12.grd", 
##D                              package="biomod2"))
##D 
##D # 1. Formatting Data
##D myBiomodData <- BIOMOD_FormatingData(resp.var = myResp,
##D                                      expl.var = myExpl,
##D                                      resp.xy = myRespXY,
##D                                      resp.name = myRespName,
##D                                      PA.nb.rep=3)
##D 
##D # 2. Defining Models Options using default options.
##D myBiomodOption <- BIOMOD_ModelingOptions()
##D 
##D # 3. Doing Modelisation
##D myBiomodModelOut <- BIOMOD_Modeling( myBiomodData, 
##D                                      models = c('CTA','RF','GLM','GAM','ANN','MARS'), 
##D                                      models.options = myBiomodOption, 
##D                                      NbRunEval=5, 
##D                                      DataSplit=70, 
##D                                      Prevalence=0.5,
##D                                      models.eval.meth = c('TSS'),
##D                                      do.full.models = FALSE,
##D                                      rescal.all.models=T,
##D                                      modeling.id='test')
##D 
##D # 4. Build ensemble-models that will be taken as reference
##D myBiomodEM <- BIOMOD_EnsembleModeling( modeling.output = myBiomodModelOut,
##D                                        chosen.models = 'all',
##D                                        em.by = 'all',
##D                                        eval.metric = c('TSS'),
##D                                        eval.metric.quality.threshold = c(0.7),
##D                                        prob.mean = TRUE,
##D                                        prob.median = TRUE)
##D 
##D # 5. Projection on future environmental conditions
##D 
##D ## load future environmental conditions from biomod2 package 
##D myExpl_fut <- stack( system.file( "external/bioclim/future/bio3.grd", 
##D                                   package="biomod2"),
##D                      system.file( "external/bioclim/future/bio4.grd", 
##D                                   package="biomod2"), 
##D                      system.file( "external/bioclim/future/bio7.grd", 
##D                                   package="biomod2"),  
##D                      system.file( "external/bioclim/future/bio11.grd", 
##D                                   package="biomod2"), 
##D                      system.file( "external/bioclim/future/bio12.grd", 
##D                                   package="biomod2"))
##D 
##D myBiomodProjection <- BIOMOD_Projection(modeling.output = myBiomodModelOut,
##D                                         new.env = myExpl_fut,
##D                                         proj.name = 'future',
##D                                         selected.models = 'all',
##D                                         binary.meth = 'TSS',
##D                                         compress = FALSE,
##D                                         build.clamping.mask = TRUE)
##D 
##D BIOMOD_EnsembleForecasting(projection.output=myBiomodProjection,
##D                            EM.output=myBiomodEM,
##D                            binary.meth='TSS')
##D 
##D # 6. load binary projections
##D consensusBin <- stack('GuloGulo/proj_future/proj_future_GuloGulo_ensemble_TSSbin.grd')
##D projectionsBin <- stack('GuloGulo/proj_future/proj_future_GuloGulo_TSSbin.grd')
##D 
##D # 7. build a ref state based on ensemble-models
##D ref <- sampleRandom(subset(consensusBin, 1, drop=T), size=5000, sp=T, na.rm=T)
##D 
##D # 8. autoatic creation of groups matrix
##D find_groups <- function(diff_by_pix){
##D   data.set <- sapply(names(diff_by_pix),biomod2:::.extractModelNamesInfo,info='data.set')
##D   run.eval <- sapply(names(diff_by_pix),biomod2:::.extractModelNamesInfo,info='run.eval')
##D   models <- sapply(names(diff_by_pix),biomod2:::.extractModelNamesInfo,info='models')
##D   return(rbind(data.set,run.eval,models))  
##D }
##D 
##D groups <- find_groups(projectionsBin)
##D 
##D # 9. plot ProbDensFunct graphs
##D ProbDensFunc(initial = ref,
##D              projections = projectionsBin, 
##D              plothist=TRUE, 
##D              cvsn=TRUE, 
##D              groups=groups, 
##D              resolution=2, 
##D              filename=NULL, 
##D              lim=c(0.5,0.8,0.95))
##D 
##D ## 3 plots should be produced.. Should be convenient to save it within a device
##D ## supporting multiple plots.
##D 
## End(Not run)



