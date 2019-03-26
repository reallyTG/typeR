library(pla)


### Name: HumanHepatitis
### Title: Human Hepatitis A immunoglobulin - Elisa
### Aliases: HumanHepatitis
### Keywords: datasets

### ** Examples

Example <- "Example 8 "
data(HumanHepatitis); Data <- HumanHepatitis

Data <- readAssayTable(paste(system.file(package = "pla"),
                             "vignettes/CombiStat/data/HumanHepatitis.txt",
                             sep = "/"), fun = sqrt,
                       rows = "Dilutions & Samples", columns = "Replicates")
plaModel <- plaCRD(Data); plaModel
plots    <- plot(plaModel)



