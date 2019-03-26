library(pla)


### Name: Erythromycin
### Title: Erythromycin - Assay 1
### Aliases: Erythromycin
### Keywords: datasets

### ** Examples

Example <- "Example 22"
data(Erythromycin); Data <- Erythromycin

Data <- readAssayTable(paste(system.file(package = "pla"),
                             "vignettes/CombiStat/data/Erythromycin.txt",
                             sep = "/"),
                       rows = "Block", columns = "Dilutions & Samples")
plaModel <- plaCRD(Data); plaModel
plots    <- plot(plaModel)



