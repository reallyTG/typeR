library(pla)


### Name: FactorIX
### Title: Factor IX - Coagulation
### Aliases: FactorIX
### Keywords: datasets

### ** Examples

Example <- "Example 3"
data(FactorIX); Data <- FactorIX

Data <- readAssayTable(paste(system.file(package = "pla"),
                             "vignettes/CombiStat/data/FactorIX.txt",
                             sep = "/"), fun = log10,
                       rows = "Dilutions & Samples", columns = "Replicates")
plaModel <- plaCRD(Data); plaModel
plots    <- plot(plaModel)



