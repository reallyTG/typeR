library(tigreBrowserWriter)


### Name: insertFigureData
### Title: Insert figure data directly to the database
### Aliases: insertFigureData

### ** Examples

  db <- initializeDb("", "My Dataset")
  logl <- c(-4.0, -2.0, 0.0)
  names(logl) <- c("A", "B", "C")
  baselogl <- c(1.0, -1.0, 4.0)
  names(baselogl) <- names(logl)
  db <- insertResults(db, "testexperiment", "testregulator", "",
                      logl, baselineloglikelihoods=baselogl)
  # Generate a dummy plot (reused for all data elements for simplicity)
  examplefile <- tempfile("plot", fileext=".png")
  png(examplefile)
  plot(c(0, 1), c(0, 1))
  dev.off()
  figures <- list(A=examplefile, B=examplefile, C=examplefile)
  db <- insertFigureData(db, "testexperiment", "testregulator",
                         figures)
  closeDb(db)



