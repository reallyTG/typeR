library(pla)


### Name: Nystatin
### Title: Nystatin: Antibiotic agar diffusion assay
### Aliases: Nystatin
### Keywords: datasets

### ** Examples

Example <- "Example 15"
data(Nystatin); Data <- Nystatin

Data <- readAssayTable(paste(system.file(package = "pla"),
                             "vignettes/CombiStat/data/Nystatin.txt",
                             sep = "/"),
                       rows = "Measurements", 
                       columns = "All factors and variables")
plaModel <- plaLSD(Data)
Fits     <- fit(plaModel)
plots    <- plot(plaModel)



