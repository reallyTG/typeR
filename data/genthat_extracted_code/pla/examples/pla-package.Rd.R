library(pla)


### Name: pla-package
### Title: Parallel Line Assays
### Aliases: pla-package
### Keywords: package

### ** Examples

data(Corticotrophin); Data <- Corticotrophin

Design <- "crd"
Data <- readAssayTable(paste(system.file(package = "pla"),
                             "vignettes/PhEur/data/Corticotrophin.txt",
                             sep = "/"))
Frame  <- as.data.frame(Data)
fits <- pla.fit(Frame, design = Design, sampleLabels = c("S", "T", "U"),
                dr = 4, returnPotencyEstimates = TRUE)
plots <- pla.plots(Frame, design = Design, sampleLabels = c("S", "T", "U"), 
                   colTst = c("blue", "red"), showRho = FALSE,
                   main = "PhEur: Corticotrophin; Subcutaneous Injection In Rats",
                   tests = fits@tests,)

## Alternative on object of class 'pla':
plaModel <- plaCRD(Data,
                   assayTitle = "PhEur: Corticotrophin; Subcutaneous Injection In Rats")
Fits <- fit(plaModel)



