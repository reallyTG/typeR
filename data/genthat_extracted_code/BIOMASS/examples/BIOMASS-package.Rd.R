library(BIOMASS)


### Name: BIOMASS-package
### Title: BIOMASS: Estimating Aboveground Biomass and Its Uncertainty in
###   Tropical Forests
### Aliases: BIOMASS BIOMASS-package
### Keywords: internal

### ** Examples

## Not run: 
##D library(BIOMASS)
##D 
##D # Dataset containing plot inventory data from Karnataka, India (Ramesh et al. 2010)
##D data(KarnatakaForest)
##D str(KarnatakaForest)
##D 
##D # Dataset containing height and diameter measurements from two 1-ha plots
##D # established in the lowland rainforest of French Guiana, at the Nouragues
##D # Ecological Research Station
##D data(NouraguesHD)
##D str(NouraguesHD)
##D 
##D #############################################################################
##D # WOOD DENSITY
##D 
##D # 1-RETRIEVE AND CORRECT TAXONOMY
##D 
##D # Checking typos in taxonomy
##D Taxo <- correctTaxo(genus = KarnatakaForest$genus, species = KarnatakaForest$species)
##D KarnatakaForest$genusCorr <- Taxo$genusCorrected
##D KarnatakaForest$speciesCorr <- Taxo$speciesCorrected
##D 
##D # Retrieving APG III Families and Orders from Genus names
##D APG <- getTaxonomy(KarnatakaForest$genusCorr, findOrder = T)
##D KarnatakaForest$familyAPG <- APG$family
##D KarnatakaForest$orderAPG <- APG$order
##D 
##D # 2-RETRIEVE WOOD DENSITY
##D dataWD <- getWoodDensity(
##D   genus = KarnatakaForest$genusCorr,
##D   species = KarnatakaForest$speciesCorr,
##D   stand = KarnatakaForest$plotID
##D )
##D 
##D #############################################################################
##D # TREE HEIGHT
##D 
##D # Compare different local H-D models
##D modelHD(
##D   D = NouraguesHD$D, H = NouraguesHD$H,
##D   drawGraph = TRUE, useWeight = TRUE
##D )
##D 
##D # Compute the local H-D model with the lowest RSE
##D HDmodel <- modelHD(
##D   D = NouraguesHD$D, H = NouraguesHD$H,
##D   method = "log2", useWeight = TRUE
##D )
##D 
##D # Compute plot-specific H-D models
##D HDmodelPerPlot <- modelHD(NouraguesHD$D, NouraguesHD$H,
##D   method = "weibull",
##D   useWeight = T, plot = NouraguesHD$plotId
##D )
##D 
##D RSEmodels <- sapply(HDmodelPerPlot, function(x) x$RSE)
##D Coeffmodels <- lapply(HDmodelPerPlot, function(x) x$coefficients)
##D 
##D # Retrieve height data from a local HD model
##D dataHlocal <- retrieveH(D = KarnatakaForest$D, model = HDmodel)
##D 
##D # Retrieve height data from a Feldpaush et al. (2012) averaged model
##D dataHfeld <- retrieveH(D = KarnatakaForest$D, region = "SEAsia")
##D 
##D # Retrieve height data from Chave et al. (2012) equation 6
##D dataHchave <- retrieveH(
##D   D = KarnatakaForest$D,
##D   coord = cbind(KarnatakaForest$long, KarnatakaForest$lat)
##D )
##D 
##D #############################################################################
##D # AGB CALCULATION
##D 
##D KarnatakaForest$WD <- dataWD$meanWD
##D KarnatakaForest$H <- dataHlocal$H
##D KarnatakaForest$Hfeld <- dataHfeld$H
##D 
##D # Compute AGB(Mg) per tree
##D AGBtree <- computeAGB(
##D   D = KarnatakaForest$D, WD = KarnatakaForest$WD,
##D   H = KarnatakaForest$H
##D )
##D 
##D # Compute AGB(Mg) per plot
##D AGBplot <- summaryByPlot(AGBtree, KarnatakaForest$plotId)
##D 
##D # Compute AGB(Mg) per tree without height information (Eq. 7 from Chave et al. (2014))
##D AGBplotChave <- summaryByPlot(
##D   computeAGB(
##D     D = KarnatakaForest$D, WD = KarnatakaForest$WD,
##D     coord = KarnatakaForest[, c("long", "lat")]
##D   ),
##D   plot = KarnatakaForest$plotId
##D )
##D 
##D # Compute AGB(Mg) per tree with Feldpausch et al. (2012) regional H-D model
##D AGBplotFeld <- summaryByPlot(
##D   computeAGB(
##D     D = KarnatakaForest$D, WD = KarnatakaForest$WD,
##D     H = KarnatakaForest$Hfeld
##D   ),
##D   plot = KarnatakaForest$plotId
##D )
##D 
##D #############################################################################
##D # PROPAGATING ERRORS
##D 
##D KarnatakaForest$sdWD <- dataWD$sdWD
##D KarnatakaForest$HfeldRSE <- dataHfeld$RSE
##D 
##D # Per plot using the local HD model constructed above (modelHD)
##D resultMC <- AGBmonteCarlo(
##D   D = KarnatakaForest$D, WD = KarnatakaForest$WD, errWD = KarnatakaForest$sdWD,
##D   HDmodel = HDmodel, Dpropag = "chave2004"
##D )
##D resMC <- summaryByPlot(resultMC$AGB_simu, KarnatakaForest$plotId)
##D 
##D # Per plot using the Feldpaush regional HD averaged model
##D AGBmonteCarlo(
##D   D = KarnatakaForest$D, WD = KarnatakaForest$WD,
##D   errWD = KarnatakaForest$sdWD, H = KarnatakaForest$Hfeld,
##D   errH = KarnatakaForest$HfeldRSE, Dpropag = "chave2004"
##D )
##D resMC <- summaryByPlot(resultMC$AGB_simu, KarnatakaForest$plotId)
##D 
##D # Per plot using Chave et al. (2014) Equation 7
##D resultMC <- AGBmonteCarlo(
##D   D = KarnatakaForest$D, WD = KarnatakaForest$WD, errWD = KarnatakaForest$sdWD,
##D   coord = KarnatakaForest[, c("long", "lat")],
##D   Dpropag = "chave2004"
##D )
##D resMC <- summaryByPlot(resultMC$AGB_simu, KarnatakaForest$plotId)
## End(Not run)



