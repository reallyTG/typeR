library(biomod2)


### Name: BIOMOD_tuning
### Title: Tune models parameters
### Aliases: BIOMOD_tuning

### ** Examples

## Not run: 
##D # species occurrences
##D DataSpecies <- read.csv(system.file("external/species/mammals_table.csv",
##D                                     package="biomod2"))
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
##D # 1. Formatting Data
##D myBiomodData <- BIOMOD_FormatingData(resp.var = myResp,
##D                                      expl.var = myExpl,
##D                                      resp.xy = myRespXY,
##D                                      resp.name = myRespName)
##D 
##D # 2. Defining Models Options using default options.
##D ### Duration for turing all models sequential with default settings 
##D ### on 3.4 GHz processor: approx. 45 min tuning all models in parallel
##D ### (on 8 cores) using foreach loops runs much faster: approx. 14 min
##D 
##D #library(doParallel);cl<-makeCluster(8);registerDoParallel(cl) 
##D 
##D 
##D time.seq<-system.time(Biomod.tuning <- BIOMOD_tuning(myBiomodData,
##D                                                              env.ME = myExpl,
##D                                                              n.bg.ME = ncell(myExpl)))
##D #stopCluster(cl)
##D 
##D myBiomodModelOut <- BIOMOD_Modeling( myBiomodData, 
##D                                      models = c('RF','CTA'), 
##D                                      models.options = Biomod.tuning$models.options, 
##D                                      NbRunEval=1, 
##D                                      DataSplit=100, 
##D                                      VarImport=0, 
##D                                      models.eval.meth = c('ROC'),
##D                                      do.full.models=FALSE,
##D                                      modeling.id="test")
##D 
##D 
##D #  eval.plot(Biomod.tuning$tune.MAXENT.Phillips at results)
##D par(mfrow=c(1,3))
##D plot(Biomod.tuning$tune.CTA.rpart)
##D plot(Biomod.tuning$tune.CTA.rpart2)
##D plot(Biomod.tuning$tune.RF)
## End(Not run)



