library(pla)


### Name: pla.plots
### Title: Make plots for parallel line models
### Aliases: pla.plots
### Keywords: design

### ** Examples

data(HepatitisB); Data <- HepatitisB

Design <- "crd"
Data <- readAssayTable(paste(system.file(package = "pla"),
                             "vignettes/PhEur/data/HepatitisB.txt",
                             sep = "/"))
Frame  <- as.data.frame(Data)

fits   <- pla.fit(Frame, design = Design, sampleLabels = c("S", "T", "U", "V"), 
                  dr = 2.25, returnPotencyEstimates = TRUE)

cbbPalette <- c("#000000", "#009E73", "#e79f00", "#9ad0f3",
                "#0072B2", "#D55E00", "#CC79A7", "#F0E442")

plots <- pla.plots(Frame, sampleLabels = c("S", "T", "U", "V"),
                   nc = 3, showRho = FALSE, colTst = cbbPalette[2:4],
                   ## main = Data@assayTitle,
                   main = "PhEur: HepatitisB; Three hepatitis B vaccines against a standard",
                   tests = fits@tests)

## Alternative on object of class 'pla':

plaModel <- plaCRD(Data,
  assayTitle = "PhEur: HepatitisB; Three hepatitis B vaccines against a standard")
print(plaModel, formatTest = "short")
plots    <- plot(plaModel)



