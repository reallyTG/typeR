library(SSDM)


### Name: modelling
### Title: Build an SDM using a single algorithm
### Aliases: modelling

### ** Examples

# Loading data
data(Env)
data(Occurrences)
Occurrences <- subset(Occurrences, Occurrences$SPECIES == 'elliptica')

# SDM building
SDM <- modelling('GLM', Occurrences, Env, Xcol = 'LONGITUDE', Ycol = 'LATITUDE')

# Results plotting
## Not run: 
##D plot(SDM)
## End(Not run)





