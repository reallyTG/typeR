library(BIOMASS)


### Name: computeAGB
### Title: Computing tree above-ground biomass (AGB)
### Aliases: computeAGB
### Keywords: AGB above-ground allometry biomass carbon forest

### ** Examples

# Create variables
D <- 10:99
WD <- runif(length(D), min = 0.1, max = 1)
H <- D^(2 / 3)

# If you have height data
AGB <- computeAGB(D, WD, H)

# If you do not have height data and a single site
lat <- 4.08
long <- -52.68
coord <- cbind(long, lat)
## Not run: 
##D AGB <- computeAGB(D, WD, coord = coord)
## End(Not run)

# If you do not have height data and several sites (here three)
lat <- c(rep(4.08, 30), rep(3.98, 30), rep(4.12, 30))
long <- c(rep(-52.68, 30), rep(-53.12, 30), rep(-53.29, 30))
coord <- cbind(long, lat)
## Not run: 
##D AGB <- computeAGB(D, WD, coord = coord)
## End(Not run)




