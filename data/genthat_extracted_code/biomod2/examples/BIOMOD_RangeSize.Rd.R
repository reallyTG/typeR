library(biomod2)


### Name: BIOMOD_RangeSize
### Title: Analysis of the range size changes
### Aliases: BIOMOD_RangeSize BIOMOD_RangeSize-methods
###   BIOMOD_RangeSize,data.frame,data.frame-method
###   BIOMOD_RangeSize,array,array-method
###   BIOMOD_RangeSize,RasterStack,RasterStack-method
###   BIOMOD_RangeSize,RasterLayer,RasterLayer-method
###   BIOMOD_RangeSize,RasterLayer,RasterStack-method
### Keywords: IO

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
                                       models = c('CTA','RF'), 
                                       models.options = myBiomodOption, 
                                       models.eval.meth ='TSS',
                                       rescal.all.models=FALSE)


# 4.1 Projection on current environemental conditions

myBiomodProjection <- BIOMOD_Projection(modeling.output = myBiomodModelOut,
                                          new.env = myExpl,
                                          proj.name = 'current',
                                          selected.models = 'all',
                                          binary.meth = 'TSS',
                                          compress = FALSE,
                                          build.clamping.mask = FALSE)

# 4.2 Projection on future environemental conditions

myExplFuture = stack(system.file("external/bioclim/future/bio3.grd",package="biomod2"),
                     system.file("external/bioclim/future/bio4.grd",package="biomod2"),
                     system.file("external/bioclim/future/bio7.grd",package="biomod2"),
                     system.file("external/bioclim/future/bio11.grd",package="biomod2"),
                     system.file("external/bioclim/future/bio12.grd",package="biomod2"))

myBiomodProjectionFuture <- BIOMOD_Projection(modeling.output = myBiomodModelOut,
                                              new.env = myExplFuture,
                                              proj.name = 'future',
                                              selected.models = 'all',
                                              binary.meth = 'TSS',
                                              compress = FALSE,
                                              build.clamping.mask = TRUE)

# 5. Detect where our species occurances state is forecasted to change

# load binary projections
# here is rasters objects ('.grd')
currentPred <- stack("GuloGulo/proj_current/proj_current_GuloGulo_TSSbin.grd")
futurePred <- stack("GuloGulo/proj_future/proj_future_GuloGulo_TSSbin.grd")


# call the Range size function
myBiomodRangeSize <- BIOMOD_RangeSize(
  CurrentPred=currentPred,
  FutureProj=futurePred)

# see the results
myBiomodRangeSize$Compt.By.Models
plot(myBiomodRangeSize$Diff.By.Pixel)




