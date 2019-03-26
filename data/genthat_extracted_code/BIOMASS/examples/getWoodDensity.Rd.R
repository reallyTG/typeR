library(BIOMASS)


### Name: getWoodDensity
### Title: Estimating wood density
### Aliases: getWoodDensity
### Keywords: Wood density

### ** Examples

# Load a data set
data(KarnatakaForest)

# Compute the Wood Density up to the genus level and give the mean wood density of the dataset
WD <- getWoodDensity(
  genus = KarnatakaForest$genus,
  species = KarnatakaForest$species
)

# Compute the Wood Density up to the genus level and then give the mean wood density per stand
WD <- getWoodDensity(
  genus = KarnatakaForest$genus,
  species = KarnatakaForest$species,
  stand = KarnatakaForest$plotId
)

# Compute the Wood Density up to the family level and then give the mean wood density per stand
WD <- getWoodDensity(
  family = KarnatakaForest$family,
  genus = KarnatakaForest$genus,
  species = KarnatakaForest$species,
  stand = KarnatakaForest$plotId
)
str(WD)



