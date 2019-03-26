library(pla)


### Name: HeparinSodium
### Title: Heparin Sodium - European Pharmacopoeia (1997), 2.7.5
### Aliases: HeparinSodium
### Keywords: datasets

### ** Examples

Example <- "Example 5"
data(HeparinSodium); Data <- HeparinSodium

Data <- readAssayTable(paste(system.file(package = "pla"),
                             "vignettes/CombiStat/data/HeparinSodium.txt",
                             sep = "/"),
                       fun = function(x) 
                          apply(array(x, dim = c(6, 2, 2)), c(1, 3), mean),
                       log = 10,
                       rows = "Dilutions & Samples", 
                       columns = "Inner & Replicates")

plaModel <- plaCRD(Data); plaModel
plots    <- plot(plaModel)



