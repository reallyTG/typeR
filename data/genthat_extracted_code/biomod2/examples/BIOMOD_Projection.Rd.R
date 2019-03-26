library(biomod2)


### Name: BIOMOD_Projection
### Title: Project the calibrated models within 'biomod2' into new space or
###   time
### Aliases: BIOMOD_Projection
### Keywords: models regression nonlinear multivariate nonparametric tree

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
                                       models = c('SRE','RF'), 
                                       models.options = myBiomodOption, 
                                       NbRunEval=1, 
                                       DataSplit=70,
                                       models.eval.meth = c('TSS'),
                                       do.full.models = FALSE)


# 4.1 Projection on current environemental conditions

myBiomodProjection <- BIOMOD_Projection(modeling.output = myBiomodModelOut,
                                          new.env = myExpl,
                                          proj.name = 'current',
                                          selected.models = 'all',
                                          binary.meth = 'TSS',
                                          compress = FALSE,
                                          build.clamping.mask = FALSE)

## Not run: 
##D # 4.2 Projection on future environemental conditions
##D myExplFuture = stack(system.file("external/bioclim/future/bio3.grd",package="biomod2"),
##D                      system.file("external/bioclim/future/bio4.grd",package="biomod2"),
##D                      system.file("external/bioclim/future/bio7.grd",package="biomod2"),
##D                      system.file("external/bioclim/future/bio11.grd",package="biomod2"),
##D                      system.file("external/bioclim/future/bio12.grd",package="biomod2"))
##D 
##D myBiomodProjectionFuture <- BIOMOD_Projection(modeling.output = myBiomodModelOut,
##D                                               new.env = myExplFuture,
##D                                               proj.name = 'future',
##D                                               selected.models = 'all',
##D                                               binary.meth = 'TSS',
##D                                               compress = FALSE,
##D                                               build.clamping.mask = TRUE)
##D 
##D # print summary and plot projections
##D myBiomodProjectionFuture
##D plot(myBiomodProjectionFuture)
## End(Not run)
                                       



