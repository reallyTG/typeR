library(biomod2)


### Name: BIOMOD_presenceonly
### Title: evaluate models with presences only metrics
### Aliases: BIOMOD_presenceonly

### ** Examples

## Not run: 
##D require(PresenceAbsence)
##D 
##D # species occurrences
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
##D # the XY coordinates of species data
##D myRespXY <- DataSpecies[,c("X_WGS84","Y_WGS84")]
##D 
##D 
##D # Environmental variables extracted from BIOCLIM (bio_3, bio_4, bio_7, bio_11 & bio_12)
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
##D                                      resp.name = myRespName)
##D 
##D # 2. Defining Models Options using default options.
##D myBiomodOption <- BIOMOD_ModelingOptions()
##D 
##D # 3. Doing Modelisation
##D 
##D myBiomodModelOut <- BIOMOD_Modeling( myBiomodData, 
##D                                      models = c('SRE','CTA','RF'), 
##D                                      models.options = myBiomodOption, 
##D                                      NbRunEval=1, 
##D                                      DataSplit=80, 
##D                                      Yweights=NULL, 
##D                                      VarImport=3, 
##D                                      models.eval.meth = c('TSS','ROC'),
##D                                      SaveObj = TRUE,
##D                                      rescal.all.models = FALSE,
##D                                      do.full.models = FALSE)
##D 
##D # 4. Doing Ensemble Modelling
##D myBiomodEM <- BIOMOD_EnsembleModeling( modeling.output = myBiomodModelOut,
##D                                        chosen.models = 'all',
##D                                        em.by = 'PA_dataset+repet',
##D                                        eval.metric = c('TSS'),
##D                                        eval.metric.quality.threshold = c(0.7),
##D                                        models.eval.meth = c('TSS','ROC'),
##D                                        prob.mean = TRUE,
##D                                        prob.cv = FALSE,
##D                                        prob.ci = FALSE,
##D                                        prob.ci.alpha = 0.05,
##D                                        prob.median = FALSE,
##D                                        committee.averaging = FALSE,
##D                                        prob.mean.weight = TRUE,
##D                                        prob.mean.weight.decay = 'proportional' )   
##D 
##D # evaluate Biomod models with the Boyce index and MPA
##D pres.only.eval <- BIOMOD_presenceonly(myBiomodModelOut, myBiomodEM)
##D pres.only.eval$eval
## End(Not run)



