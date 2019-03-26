library(biomod2)


### Name: BIOMOD.models.out-RemoveProperly
### Title: remove properly BIOMOD_Modeling outputs
### Aliases: RemoveProperly RemoveProperly,BIOMOD.models.out-method
### Keywords: models

### ** Examples

  ## Not run: 
##D   # species occurrences
##D   DataSpecies <- read.csv(system.file("external/species/mammals_table.csv",
##D                                     package="biomod2"), row.names = 1)
##D   head(DataSpecies)
##D   
##D   # the name of studied species
##D   myRespName <- 'VulpesVulpes'
##D   
##D   # the presence/absences data for our species 
##D   myResp <- as.numeric(DataSpecies[,myRespName])
##D   
##D   # the XY coordinates of species data
##D   myRespXY <- DataSpecies[,c("X_WGS84","Y_WGS84")]
##D   
##D   
##D   # Environmental variables extracted from BIOCLIM (bio_3, bio_4, bio_7, bio_11 & bio_12)
##D   myExpl = stack( system.file( "external/bioclim/current/bio3.grd", 
##D                        package="biomod2"),
##D                   system.file( "external/bioclim/current/bio4.grd", 
##D                                package="biomod2"), 
##D                   system.file( "external/bioclim/current/bio7.grd", 
##D                                package="biomod2"),  
##D                   system.file( "external/bioclim/current/bio11.grd", 
##D                                package="biomod2"), 
##D                   system.file( "external/bioclim/current/bio12.grd", 
##D                                package="biomod2"))
##D   
##D   # 1. Formatting Data
##D   myBiomodData <- BIOMOD_FormatingData(resp.var = myResp,
##D                                        expl.var = myExpl,
##D                                        resp.xy = myRespXY,
##D                                        resp.name = myRespName)
##D   
##D   # 2. Defining Models Options using default options.
##D   myBiomodOption <- BIOMOD_ModelingOptions()
##D   
##D   # 3. Doing Modelisation
##D   
##D   myBiomodModelOut <- BIOMOD_Modeling( myBiomodData, 
##D                                        models = c('SRE'), 
##D                                        models.options = myBiomodOption, 
##D                                        NbRunEval=1, 
##D                                        DataSplit=80, 
##D                                        Prevalence=0.5, 
##D                                        VarImport=0, 
##D                                        models.eval.meth = c('TSS','ROC'),
##D                                        do.full.models=FALSE,
##D                                        modeling.id="test2")
##D   
##D   # files have been created on hard drive
##D   list.files(myRespName,all.files=TRUE,recursive=TRUE)
##D   
##D   # remove properly the modeling objects and all the file saved on hard drive
##D   RemoveProperly(myBiomodModelOut)
##D   
##D   # check files had been removed
##D   list.files(myRespName,all.files=TRUE,recursive=TRUE)
##D   
## End(Not run)



