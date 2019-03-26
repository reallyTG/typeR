library(biomod2)


### Name: BIOMOD_cv
### Title: Custom models cross-validation procedure
### Aliases: BIOMOD_cv

### ** Examples

## Not run: 
##D # species occurrences
##D DataSpecies <- read.csv(system.file("external/species/mammals_table.csv",
##D                                     package="biomod2"))
##D head(DataSpecies)
##D 
##D the name of studied species
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
##D 
##D # 3. Creating DataSplitTable
##D 
##D DataSplitTable <- BIOMOD_cv(myBiomodData, k=5, rep=2, do.full.models=F)
##D DataSplitTable.y <- BIOMOD_cv(myBiomodData,stratified.cv=T, stratify="y", k=2)
##D colnames(DataSplitTable.y)[1:2] <- c("RUN11","RUN12")
##D DataSplitTable <- cbind(DataSplitTable,DataSplitTable.y)
##D head(DataSplitTable)
##D 
##D # 4. Doing Modelisation
##D 
##D myBiomodModelOut <- BIOMOD_Modeling( myBiomodData, 
##D                                      models = c('RF'), 
##D                                      models.options = myBiomodOption, 
##D                                      DataSplitTable = DataSplitTable,
##D                                      VarImport=0, 
##D                                      models.eval.meth = c('ROC'),
##D                                      do.full.models=FALSE,
##D                                      modeling.id="test")
##D 
##D ## get cv evaluations
##D eval <- get_evaluations(myBiomodModelOut,as.data.frame=T)
##D 
##D eval$strat <- NA
##D eval$strat[grepl("13",eval$Model.name)] <- "Full"
##D eval$strat[!(grepl("11",eval$Model.name)|
##D              grepl("12",eval$Model.name)|
##D              grepl("13",eval$Model.name))] <- "Random"
##D eval$strat[grepl("11",eval$Model.name)|grepl("12",eval$Model.name)] <- "Strat"
##D 
##D boxplot(eval$Testing.data~ eval$strat, ylab="ROC AUC")
## End(Not run)



