library(afmToolkit)


### Name: afmReadVeecoFolder
### Title: Read all Bruke Nanoscope Veeco ascii files in a folder
### Aliases: afmReadVeecoFolder

### ** Examples

folder <- paste(path.package("afmToolkit"), "veecoFolder",sep = "/")
data <- afmReadVeecoFolder(folder = folder)
str(data)



