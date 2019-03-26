library(sdcTable)


### Name: protectTable
### Title: protecting 'sdcProblem-class' objects
### Aliases: protectTable

### ** Examples

# load problem (as it was created after performing primary suppression
# in the example of \code{primarySuppression})
sp <- searchpaths()
fn <- paste(sp[grep("sdcTable", sp)], "/data/problemWithSupps.RData", sep="")
problem <- get(load(fn))

# protect the table using the 'HITAS' algorithm with verbose output
protectedData <- protectTable(problem, method='HITAS', verbose=TRUE, useC=TRUE)

# showing a summary
summary(protectedData)

# looking at the final table with result suppression pattern
print(getInfo(protectedData, type='finalData'))



