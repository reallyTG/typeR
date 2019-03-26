library(afmToolkit)


### Name: afmexperiment
### Title: AFM experiment
### Aliases: afmexperiment

### ** Examples

dataFolder <- paste(path.package("afmToolkit"), "afmexperiment",sep = "/")
dataFiles <- list.files(dataFolder, pattern = "force", full.names = FALSE)
data <- lapply(dataFiles, afmReadJPK, path = dataFolder)
names(data) <- dataFiles
data <- afmexperiment(data)
plot(data[[1]])



