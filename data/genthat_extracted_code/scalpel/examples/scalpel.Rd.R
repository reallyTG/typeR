library(scalpel)


### Name: scalpel
### Title: Perform entire SCALPEL pipeline.
### Aliases: scalpel

### ** Examples

## Not run: 
##D ### many of the functions in this package are interconnected so the
##D ### easiest way to learn to use the package is by working through the vignette,
##D ### which is available at ajpete.com/software
##D 
##D #existing folder to save results (update this to an existing folder on your computer)
##D outputFolder = "scalpelResults"
##D #location on computer of raw data in R package to use
##D rawDataFolder = gsub("Y_1.rds", "", system.file("extdata", "Y_1.rds", package = "scalpel"))
##D #video height of raw data in R package
##D videoHeight = 30
##D #run SCALPEL pipeline
##D scalpelOutput = scalpel(outputFolder = outputFolder, rawDataFolder = rawDataFolder,
##D                        videoHeight = videoHeight)
##D #summarize each step
##D summary(scalpelOutput, step = 0)
##D summary(scalpelOutput, step = 1)
##D summary(scalpelOutput, step = 2)
##D summary(scalpelOutput, step = 3)
## End(Not run)



