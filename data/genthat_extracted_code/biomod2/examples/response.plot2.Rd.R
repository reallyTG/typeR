library(biomod2)


### Name: response.plot2
### Title: Function for for plotting predicted responses from species
###   distribution models in 2 or 3 dimensions
### Aliases: response.plot2
### Keywords: dplot models regression nonlinear multivariate nonparametric
###   tree

### ** Examples

## Not run: 
##D # species occurrences
##D DataSpecies <- read.csv(system.file("external/species/mammals_table.csv",
##D                                     package="biomod2"), row.names = 1)
##D head(DataSpecies)
##D 
##D # the name of studied species
##D myRespName <- 'VulpesVulpes'
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
##D                      package="biomod2"),
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
##D                                        models = c('RF','GLM'), 
##D                                        models.options = myBiomodOption, 
##D                                        NbRunEval=2, 
##D                                        DataSplit=80, 
##D                                        Prevalence=0.5,
##D                                        VarImport=0, 
##D                                        models.eval.meth = c('TSS'),
##D                                        SaveObj = TRUE,
##D                                        do.full.models=FALSE)
##D 
##D 
##D # 4. Plot response curves
##D 
##D # 4.1 Load the models for which we want to extract the predicted response curves
##D myGLMs <- BIOMOD_LoadModels(myBiomodModelOut, models='GLM')
##D 
##D # 4.2 plot 2D response plots
##D myRespPlot2D <- response.plot2(models  = myGLMs,
##D                                Data = get_formal_data(myBiomodModelOut,'expl.var'), 
##D                                show.variables= get_formal_data(myBiomodModelOut,'expl.var.names'),
##D                                do.bivariate = FALSE,
##D                                fixed.var.metric = 'median',
##D                                col = c("blue", "red"),
##D                                legend = TRUE,
##D                                data_species = get_formal_data(myBiomodModelOut,'resp.var'))
##D 
##D # 4.2 plot 3D response plots
##D ## here only for a lone model (i.e "VulpesVulpes_PA1_AllData_GLM")
##D myRespPlot3D <- response.plot2(models  = myGLMs[1],
##D                                Data = get_formal_data(myBiomodModelOut,'expl.var'), 
##D                                show.variables= get_formal_data(myBiomodModelOut,'expl.var.names'),
##D                                do.bivariate = TRUE,
##D                                fixed.var.metric = 'median',
##D                                data_species = get_formal_data(myBiomodModelOut,'resp.var'),
##D                                display_title=FALSE)
##D 
##D ### all the values used to produce this plot are stored into the returned object
##D ### you can redo plots by yourself and customised them
##D dim(myRespPlot2D)
##D dimnames(myRespPlot2D)
##D 
##D dim(myRespPlot3D)
##D dimnames(myRespPlot3D)
## End(Not run)



