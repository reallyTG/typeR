library(sdcTable)


### Name: getInfo
### Title: query information from objects
### Aliases: getInfo

### ** Examples

# load problem (as it was created in the example
# of \code{makeProblem})
sp <- searchpaths()
fn <- paste(sp[grep("sdcTable", sp)], "/data/problem.RData", sep="")
problem <- get(load(fn))

# problem is an object of class \code{sdcProblem-class}
print(class(problem))

for (slot in c('lb','ub','LPL','SPL','UPL','sdcStatus',
  'freq', 'strID', 'numVars', 'w')) {
  cat('slot', slot,':\n')
  print(getInfo(problem, type=slot))
}

# extracting information for objects of class \code{safeObj-class}
fn <- paste(sp[grep("sdcTable", sp)], "/data/protectedData.RData", sep="")
protectedData <- get(load(fn))
for (slot in c('finalData', 'nrNonDuplicatedCells', 'nrPrimSupps',
  'nrSecondSupps', 'nrPublishableCells', 'suppMethod')) {
  cat('slot', slot,':\n')
  print(getInfo(protectedData, type=slot))
}



