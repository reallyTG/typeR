library(pla)


### Name: HepatitisBvaccine
### Title: Hepatitis B vaccine
### Aliases: HepatitisBvaccine
### Keywords: datasets

### ** Examples

Example  <- "Example 7"
data(HepatitisBvaccine); Data <- HepatitisBvaccine

Data <- readAssayTable(paste(system.file(package = "pla"),
                             "vignettes/CombiStat/data/HepatitisBvaccine.txt",
                             sep = "/"), fun = log,
                       rows = "Dilutions & Samples", columns = "Replicates")
plaModel <- plaCRD(Data); plaModel
plots    <- plot(plaModel)



