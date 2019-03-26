library(sdcTable)


### Name: cellInfo
### Title: query information for a specific cell in 'safeObj-class' objects
### Aliases: cellInfo

### ** Examples

# load protected data (as created in the example
# of \code{protectTable})
sp <- searchpaths()
fn <- paste(sp[grep("sdcTable", sp)], "/data/protectedData.RData", sep="")
protectedData <- get(load(fn))
characteristics <- c('male', 'D')
varNames <- c('gender', 'region')
info <- cellInfo(protectedData, characteristics, varNames, verbose=FALSE)

# show the info about this cell
str(info)




