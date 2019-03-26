library(MALDIquantForeign)


### Name: importImzMl
### Title: Import imzML files
### Aliases: importImzMl

### ** Examples


library("MALDIquant")
library("MALDIquantForeign")

## get example directory
exampleDirectory <- system.file("exampledata", package="MALDIquantForeign")

## import
s <- importImzMl(file.path(exampleDirectory, "tiny_continuous.imzML"))

## import only spectra for pixel 1,1 and 2,1
s <- importImzMl(file.path(exampleDirectory, "tiny_continuous.imzML"),
                 coordinates = cbind(1:2, c(1, 1)))




