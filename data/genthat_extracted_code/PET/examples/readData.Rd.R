library(PET)


### Name: readData
### Title: Reload Saved Datasets in different Formats.
### Aliases: readData
### Keywords: IO file

### ** Examples

P <- phantom()
writeData(P, "Phantom.pet", fileOverwrite="YES" )
P.new <- readData("Phantom.pet", DebugLevel = "Normal")
viewData(P.new$Signal)
rm(P, P.new)



