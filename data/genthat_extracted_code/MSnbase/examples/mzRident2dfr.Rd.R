library(MSnbase)


### Name: as
### Title: Coerce identification data to a 'data.frame'
### Aliases: as as.data.frame.mzRident

### ** Examples

## find path to a mzIdentML file
identFile <- dir(system.file(package = "MSnbase", dir = "extdata"),
                 full.name = TRUE, pattern = "dummyiTRAQ.mzid")
library("mzR")
x <- openIDfile(identFile)
x
as(x, "data.frame")



