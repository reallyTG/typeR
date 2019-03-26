library(pla)


### Name: AgarDiffusionAssay
### Title: Antibiotic agar diffusion assay using a rectangular tray
### Aliases: AgarDiffusionAssay
### Keywords: datasets

### ** Examples

data(AgarDiffusionAssay); Agar <- AgarDiffusionAssay
Agar <- read.table(paste(system.file(package = "pla"),
                   "vignettes/PhEur/data/AntibioticAgarDiffusionAssay.txt",
                   sep = "/"), header = TRUE)
select   <- c("Row", "Column", "Sample", "Dilution", "Response")
PHframe  <- data2assayFrame(Agar[, select])
plaModel <- pla(Agar, design = "lsd",
                assayTitle = "PhEur: Antibiotic agar diffusion assay")
plots    <- plot(plaModel, plots = "all", mfrow = c(3, 4))



