library(envirem)


### Name: aridityIndexThornthwaite
### Title: aridityIndexThornthwaite
### Aliases: aridityIndexThornthwaite

### ** Examples

## No test: 
# Find example rasters
rasterFiles <- list.files(system.file('extdata', package='envirem'), full.names=TRUE)
env <- stack(rasterFiles)

# identify the appropriate layers
meantemp <- grep('mean', names(env), value=TRUE)
solar <- grep('solrad', names(env), value=TRUE)
maxtemp <- grep('tmax', names(env), value=TRUE)
mintemp <- grep('tmin', names(env), value=TRUE)

# read them in as rasterStacks
meantemp <- stack(env[[meantemp]])
solar <- stack(env[[solar]])
maxtemp <- stack(env[[maxtemp]])
mintemp <- stack(env[[mintemp]])
tempRange <- abs(maxtemp - mintemp)

# get monthly PET
pet <- monthlyPET(meantemp, solar, tempRange)

precip <- grep('prec', names(env), value=TRUE)
precip <- stack(env[[precip]])

aridityIndexThornthwaite(precip, pet)
## End(No test)




