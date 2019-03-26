library(pla)


### Name: Turbidimetric
### Title: Antibiotic turbidimetric assay
### Aliases: Turbidimetric
### Keywords: datasets

### ** Examples

data(Turbidimetric); Data <- Turbidimetric

Data <- readAssayTable(paste(system.file(package = "pla"),
                             "vignettes/PhEur/data/AntibioticTurbidimetric.txt",
                             sep = "/"))
plaModel <- plaRBD(Data,
                   assayTitle = "PhEur: Antibiotic turbidimetric assay")
plaModel
plots    <- plot(plaModel)



