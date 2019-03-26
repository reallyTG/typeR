library(biomod2)


### Name: BIOMOD_EnsembleModeling
### Title: Create and evaluate an ensemble set of models and predictions
### Aliases: BIOMOD_EnsembleModeling
### Keywords: models

### ** Examples

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

# 3. Doing Modelisation

myBiomodModelOut <- BIOMOD_Modeling( myBiomodData, 
                                       models = c('SRE','CTA','RF'), 
                                       models.options = myBiomodOption, 
                                       NbRunEval=1, 
                                       DataSplit=80, 
                                       Yweights=NULL, 
                                       VarImport=3, 
                                       models.eval.meth = c('TSS'),
                                       SaveObj = TRUE,
                                       rescal.all.models = FALSE,
                                       do.full.models = FALSE)
                                       
# 4. Doing Ensemble Modelling
myBiomodEM <- BIOMOD_EnsembleModeling( modeling.output = myBiomodModelOut,
                           chosen.models = 'all',
                           em.by = 'all',
                           eval.metric = c('TSS'),
                           eval.metric.quality.threshold = c(0.7),
                           models.eval.meth = c('TSS','ROC'),
                           prob.mean = TRUE,
                           prob.cv = FALSE,
                           prob.ci = FALSE,
                           prob.ci.alpha = 0.05,
                           prob.median = FALSE,
                           committee.averaging = FALSE,
                           prob.mean.weight = TRUE,
                           prob.mean.weight.decay = 'proportional' )   
                                       
# print summary
myBiomodEM

# get evaluation scores
get_evaluations(myBiomodEM)

                                    



