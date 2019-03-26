library(scalpel)


### Name: scalpelStep0
### Title: Perform Step 0 of SCALPEL.
### Aliases: scalpelStep0

### ** Examples

## Not run: 
##D ### many of the functions in this package are interconnected so the
##D ### easiest way to learn to use the package is by working through the vignette,
##D ### which is available at ajpete.com/software
##D 
##D #existing folder to save results (update this to an existing folder on your computer)
##D outputFolder = "scalpelResultsStepByStep"
##D #location on computer of raw data in R package to use
##D rawDataFolder = gsub("Y_1.rds", "", system.file("extdata", "Y_1.rds", package = "scalpel"))
##D #video height of raw data in R package
##D videoHeight = 30
##D #run Step 0 of SCALPEL
##D Step0Out = scalpelStep0(outputFolder = outputFolder,
##D                        rawDataFolder = rawDataFolder, videoHeight = videoHeight)
##D summary(Step0Out)
## End(Not run)



