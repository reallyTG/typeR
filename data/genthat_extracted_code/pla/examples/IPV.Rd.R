library(pla)


### Name: IPV
### Title: Inactivated poliomyelitis vaccine - Type 3
### Aliases: IPV
### Keywords: datasets

### ** Examples

Example <- "Example 10"
data(IPV); Data <- IPV

Data <- readAssayTable(paste(system.file(package = "pla"),
                             "vignettes/CombiStat/data/IPV.txt",
                             sep = "/"), fun = log10,
                       rows = "Dilutions & Samples", columns = "Replicates")
plaModel <- plaCRD(Data); plaModel
plots    <- plot(plaModel)



