library(BIOMASS)


### Name: AGBmonteCarlo
### Title: Propagating above-ground biomass (AGB) or carbon (AGC) errors to
###   the stand level
### Aliases: AGBmonteCarlo
### Keywords: carlo monte

### ** Examples

# Load a database
data(NouraguesHD)
data(KarnatakaForest)

# Modelling height-diameter relationship
HDmodel <- modelHD(D = NouraguesHD$D, H = NouraguesHD$H, method = "log2")

# Retrieving wood density values
KarnatakaWD <- getWoodDensity(KarnatakaForest$genus, KarnatakaForest$species,
  stand = KarnatakaForest$plotId
)

# Propagating errors with a standard error in wood density in one plot
filt <- KarnatakaForest$plotId == "BSP20"
resultMC <- AGBmonteCarlo(
  D = KarnatakaForest$D[filt], WD = KarnatakaWD$meanWD[filt],
  errWD = KarnatakaWD$sdWD[filt], HDmodel = HDmodel
)
str(resultMC)

# If only the coordinates are available
lat <- KarnatakaForest$lat[filt]
long <- KarnatakaForest$long[filt]
coord <- cbind(long, lat)
## Not run: 
##D resultMC <- AGBmonteCarlo(
##D   D = KarnatakaForest$D[filt], WD = KarnatakaWD$meanWD[filt],
##D   errWD = KarnatakaWD$sdWD[filt], coord = coord
##D )
##D str(resultMC)
## End(Not run)

# Propagating errors with a standard error in wood density in all plots at once
KarnatakaForest$meanWD <- KarnatakaWD$meanWD
KarnatakaForest$sdWD <- KarnatakaWD$sdWD
## Not run: 
##D resultMC <- by(
##D   KarnatakaForest, KarnatakaForest$plotId,
##D   function(x) AGBmonteCarlo(
##D       D = x$D, WD = x$meanWD, errWD = x$sdWD,
##D       HDmodel = HDmodel, Dpropag = "chave2004"
##D     )
##D )
##D meanAGBperplot <- unlist(sapply(resultMC, "[", 1))
##D credperplot <- sapply(resultMC, "[", 4)
## End(Not run)




