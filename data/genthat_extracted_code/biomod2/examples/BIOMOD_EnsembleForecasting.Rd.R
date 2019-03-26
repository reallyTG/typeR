library(biomod2)


### Name: BIOMOD_EnsembleForecasting
### Title: Ensemble projections of species over space and time
### Aliases: BIOMOD_EnsembleForecasting
### Keywords: models

### ** Examples

# 0. Load data & Selecting Data
# species occurrences
DataSpecies <- read.csv(system.file("external/species/mammals_table.csv",
                                    package="biomod2"), row.names = 1)
head(DataSpecies)

# the name of studied species
myRespName <- 'GuloGulo'

# the presence/absences data for our species 
myResp <- as.numeric(DataSpecies[,myRespName])

# the XY coordinates of species data
myRespXY <- DataSpecies[,c("X_WGS84","Y_WGS84")]


# Environmental variables extracted from BIOCLIM (bio_3, bio_4, bio_7, bio_11 & bio_12)
myExpl = stack( system.file( "external/bioclim/current/bio3.grd", 
                     package="biomod2"),
                system.file( "external/bioclim/current/bio4.grd", 
                             package="biomod2"), 
                system.file( "external/bioclim/current/bio7.grd", 
                             package="biomod2"),  
                system.file( "external/bioclim/current/bio11.grd", 
                             package="biomod2"), 
                system.file( "external/bioclim/current/bio12.grd", 
                             package="biomod2"))

# 1. Formatting Data
myBiomodData <- BIOMOD_FormatingData(resp.var = myResp,
                                     expl.var = myExpl,
                                     resp.xy = myRespXY,
                                     resp.name = myRespName)
                                                                     
# 2. Defining Models Options using default options.
myBiomodOption <- BIOMOD_ModelingOptions()

# 3. Running the models 
myBiomodModelOut <- BIOMOD_Modeling( myBiomodData, 
                                       models = c('RF'), 
                                       models.options = myBiomodOption, 
                                       NbRunEval=2, 
                                       DataSplit=60, 
                                       Yweights=NULL, 
                                       VarImport=0, 
                                       models.eval.meth = c('TSS'),
                                       SaveObj = TRUE,
                                       rescal.all.models = FALSE,
                                       do.full.models = FALSE)
                                       
# 4. Creating the ensemble models 
myBiomodEM <- BIOMOD_EnsembleModeling( 
                 modeling.output = myBiomodModelOut,
                 chosen.models = grep('_RF', get_built_models(myBiomodModelOut), 
                                  value=TRUE),
                 em.by = 'algo',
                 eval.metric = c('TSS'),
                 eval.metric.quality.threshold = c(0.7),
                 prob.mean = TRUE,
                 prob.cv = FALSE,
                 prob.ci = FALSE,
                 prob.ci.alpha = 0.05,
                 prob.median = FALSE,
                 committee.averaging = FALSE,
                 prob.mean.weight = FALSE,
                 prob.mean.weight.decay = 'proportional' )
                                       
# 5. Individual models projections on current environmental conditions
myBiomodProjection <- BIOMOD_Projection(
                        modeling.output = myBiomodModelOut,
                        new.env = myExpl,
                        proj.name = 'current',
                        selected.models = grep('_RF', get_built_models(
                                                myBiomodModelOut), value=TRUE),
                        compress = FALSE,
                        build.clamping.mask = FALSE)
                          

# 4. Creating the ensemble projections
BIOMOD_EnsembleForecasting( projection.output = myBiomodProjection,
                            EM.output = myBiomodEM)



