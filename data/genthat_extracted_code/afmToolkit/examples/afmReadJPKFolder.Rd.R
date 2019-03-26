library(afmToolkit)


### Name: afmReadJPKFolder
### Title: Read all Nanowizard JPK ascii files in a folder
### Aliases: afmReadJPKFolder

### ** Examples

folder <- paste(path.package("afmToolkit"), "afmexperiment",sep = "/")
data <- afmReadJPKFolder(folder = folder)
str(data)



