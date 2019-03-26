library(BIOMASS)


### Name: modelHD
### Title: Fitting height-diameter models
### Aliases: modelHD

### ** Examples


# Load a data set
data(NouraguesHD)

# To model the height from a dataset
## Not run: 
##D HDmodel <- modelHD(D = NouraguesHD$D, H = NouraguesHD$H, drawGraph = TRUE)
## End(Not run)

# If the method needed is known
HDmodel <- modelHD(D = NouraguesHD$D, H = NouraguesHD$H, method = "weibull", drawGraph = TRUE)
HDmodel <- modelHD(D = NouraguesHD$D, H = NouraguesHD$H, method = "log1", drawGraph = TRUE)

# Using weights
HDmodel <- modelHD(
  D = NouraguesHD$D, H = NouraguesHD$H, method = "weibull", useWeight = TRUE,
  drawGraph = TRUE
)



