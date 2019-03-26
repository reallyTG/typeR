library(BIOMASS)


### Name: summaryByPlot
### Title: Summarize by plot (or subplot) the posterior distribution of AGB
###   values
### Aliases: summaryByPlot

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

# Propagating errors
filt <- KarnatakaForest$plotId %in% c("BSP20", "BSP14")
resultMC <- AGBmonteCarlo(
  D = KarnatakaForest$D[filt], WD = KarnatakaWD$meanWD[filt],
  errWD = KarnatakaWD$sdWD[filt], HDmodel = HDmodel
)

plot <- KarnatakaForest$plotId[ filt ]

# The summary by plot
summaryByPlot(AGB_val = resultMC$AGB_simu, plot)

# The summary by plot for computeAGB
H <- retrieveH(KarnatakaForest$D[filt], model = HDmodel)$H
AGB <- computeAGB(KarnatakaForest$D[filt], WD = KarnatakaWD$meanWD[filt], H = H)
summaryByPlot(AGB, plot)



