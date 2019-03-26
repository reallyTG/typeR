library(BIOMASS)


### Name: retrieveH
### Title: Retrieving tree height from models
### Aliases: retrieveH

### ** Examples

# Load a database
data(NouraguesHD)
model <- modelHD(D = NouraguesHD$D, H = NouraguesHD$H, method = "log2")

# If any height model is available
H <- retrieveH(D = NouraguesHD$D, model = model)

# If the only data available are the coordinates of your spot
lat <- 4.08
long <- -52.68
coord <- cbind(long, lat)
## Not run: 
##D H <- retrieveH(D = NouraguesHD$D, coord = coord)
## End(Not run)

# If the only data available is the region of your spot
H <- retrieveH(D = NouraguesHD$D, region = "GuianaShield")



