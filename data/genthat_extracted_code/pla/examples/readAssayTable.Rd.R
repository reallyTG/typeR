library(pla)


### Name: readAssayTable
### Title: Read a .txt file with responses of an assay
### Aliases: readAssayTable assayData-class assayTable-class
###   assayFrame-class print,assayFrame-method print,assayTable-method
###   show,assayFrame-method show,assayTable-method
###   as.table,assayFrame-method as.table,assayTable-method
###   as.array,assayFrame-method as.array,assayTable-method
###   as.array,data.frame-method as.data.frame,assayFrame-method
###   as.data.frame,assayTable-method
### Keywords: mich

### ** Examples

## Not run: 
##D library (lattice)
##D as.array(barley, 1:3, type = "counts", reduced = TRUE)
##D as.array(barley, 1:3, reduced = TRUE)
## End(Not run)
as.array(data.frame(Titanic), 1:4)
as.array(data.frame(CO2), response = "conc",
         factorNames = c("Plant", "Type", "Treatment"))
as.array(data.frame(CO2), response = "uptake",
         factorNames = c("Plant", "Type", "Treatment"))
as.array(data.frame(ChickWeight), response = "weight",
         factorNames = c("Time", "Chick", "Diet"))
as.array(npk)

data(Diphteria)

Data <- readAssayTable(paste(system.file(package = "pla"),
                             "vignettes/CombiStat/data/Diphteria.txt",
                             sep = "/"), fun = function(x) x^2,
                        rows = "Dilutions & Samples", columns = "Replicates")
Diphteria
print(Diphteria)
as.array(Diphteria)
as.data.frame(Diphteria)
as.table(Diphteria)

data(Nystatin)

Data <- readAssayTable(paste(system.file(package = "pla"),
                             "vignettes/CombiStat/data/Nystatin.txt",
                             sep = "/"),
                       rows = "Measurements", 
                       columns = "All factors and variables")
Nystatin
print(Nystatin)
as.array(Nystatin)
as.array(Nystatin, which = 1:3, reduced = TRUE)
as.array(Nystatin, which = 1:2, reduced = TRUE)
as.array(Nystatin, which = 1:2, FUN = var, reduced = TRUE)
as.array(Nystatin, which = 1:2, FUN = length, reduced = TRUE)
as.data.frame(Nystatin)
as.table(Nystatin, which = 1:3, reduced = TRUE)



