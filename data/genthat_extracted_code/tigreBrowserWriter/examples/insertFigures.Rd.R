library(tigreBrowserWriter)


### Name: insertFigures
### Title: Insert figure links
### Aliases: insertFigures

### ** Examples

  db <- initializeDb("", "My Dataset")
  logl <- c(-4.0, -2.0, 0.0)
  names(logl) <- c("A", "B", "C")
  baselogl <- c(1.0, -1.0, 4.0)
  names(baselogl) <- names(logl)
  db <- insertResults(db, "testexperiment", "testregulator", "",
                     logl, baselineloglikelihoods=baselogl)
  db <- insertFigures(db, "testexperiment", "testregulator",
                      "http://foo.invalid/path/${probe_name}_fit.png")
  closeDb(db)



