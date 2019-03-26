library(pla)


### Name: assayTable2frame
### Title: Expand table to matrix of measurements by variables - for
###   pla.fit and pla.plots
### Aliases: assayTable2frame
### Keywords: mich

### ** Examples

data(HepatitisB); Data <- HepatitisB

Data <- readAssayTable(paste(system.file(package = "pla"),
                             "vignettes/PhEur/data/HepatitisB.txt",
                             sep = "/"), fun = log)
Frame  <- assayTable2frame(as.array(Data))



