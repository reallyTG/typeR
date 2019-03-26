library(pla)


### Name: HepatitisB
### Title: An in-vitro assay of three hepatitis B vaccines against a
###   standard
### Aliases: HepatitisB
### Keywords: datasets

### ** Examples

data(HepatitisB); Data <- HepatitisB

cbbPalette <- c("#000000", "#009E73", "#e79f00", "#9ad0f3",
                "#0072B2", "#D55E00", "#CC79A7", "#F0E442")

Data <- readAssayTable(paste(system.file(package = "pla"),
                             "vignettes/PhEur/data/HepatitisB.txt",
                             sep = "/"), fun = log)
plaModel <- plaCRD(Data,
                   assayTitle =
            "PhEur: HepatitisB; Three hepatitis B vaccines against a standard")
plaModel
plots    <- plot(plaModel)



