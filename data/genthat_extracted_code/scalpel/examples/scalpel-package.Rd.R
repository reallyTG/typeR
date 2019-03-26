library(scalpel)


### Name: scalpel-package
### Title: scalpel: A package for processing calcium imaging data.
### Aliases: scalpel-package

### ** Examples

## Not run: 
##D ### many of the functions in this package are interconnected so the
##D ### easiest way to learn to use the package is by working through the vignette,
##D ### which is available at ajpete.com/software
##D 
##D  #general example illustrating some of the main functions
##D  #see the vignette for additional direction on using all of the functions
##D  #and the help pages for the specific functions for details on using each function
##D 
##D  #existing folder to save results (update this to an existing folder on your computer)
##D  outputFolder = "scalpelResults"
##D  #location on computer of raw data in R package to use
##D  rawDataFolder = gsub("Y_1.rds", "", system.file("extdata", "Y_1.rds", package = "scalpel"))
##D  #video height of raw data in R package
##D  videoHeight = 30
##D  #run SCALPEL pipeline
##D  scalpelOutput = scalpel(outputFolder = outputFolder, rawDataFolder = rawDataFolder,
##D                          videoHeight = videoHeight)
##D  #summarize each step
##D  summary(scalpelOutput, step = 0)
##D  summary(scalpelOutput, step = 1)
##D  summary(scalpelOutput, step = 2)
##D  summary(scalpelOutput, step = 3)
##D 
##D  #plot the spatial and temporal components
##D  plotResults(scalpelOutput = scalpelOutput)
##D  #plot a summary of the video with the found neurons outlined
##D  plotVideoVariance(scalpelOutput = scalpelOutput, neuronSet = "Afilter")
##D  #plot the frames with the most fluorescence for each found neuron
##D  plotBrightest(scalpelOutput = scalpelOutput, AfilterIndex = 1)
##D  plotBrightest(scalpelOutput = scalpelOutput, AfilterIndex = 2)
##D  plotBrightest(scalpelOutput = scalpelOutput, AfilterIndex = 3)
##D 
##D  #if you want to use results from a previous session,
##D  #use "getScalpel" to read in previous results
##D  scalpelOutputCopy = getScalpel(outputFolder = outputFolder)
##D 
## End(Not run)




