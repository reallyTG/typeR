library(pla)


### Name: Diphteria
### Title: Diphteria vaccine - Intradermal challenge
### Aliases: Diphteria
### Keywords: datasets

### ** Examples

Example  <- "Example 1"
data(Diphteria); Data <- Diphteria

Data <- readAssayTable(paste(system.file(package = "pla"),
                             "vignettes/CombiStat/data/Diphteria.txt",
                             sep = "/"), fun = function(x) x^2,
                        rows = "Dilutions & Samples", columns = "Replicates")
plaModel <- plaCRD(Data); plaModel
plots    <- plot(plaModel)



