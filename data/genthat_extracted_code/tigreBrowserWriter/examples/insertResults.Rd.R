library(tigreBrowserWriter)


### Name: insertResults
### Title: Insert results
### Aliases: insertResults

### ** Examples

  db <- initializeDb("", "My Dataset")
  logl <- c(-4.0, -2.0, 0.0)
  names(logl) <- c("A", "B", "C")
  baselogl <- c(1.0, -1.0, 4.0)
  names(baselogl) <- names(logl)
  db <- insertResults(db, "testexperiment", "testregulator", "",
                     logl, baselineloglikelihoods=baselogl)
  closeDb(db)



