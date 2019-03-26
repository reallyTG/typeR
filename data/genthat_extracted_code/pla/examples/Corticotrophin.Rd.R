library(pla)


### Name: Corticotrophin
### Title: An assay of corticotrophin by subcutaneous injection in rats
### Aliases: Corticotrophin
### Keywords: datasets

### ** Examples

data(Corticotrophin); Data <- Corticotrophin

Data <- readAssayTable(paste(system.file(package = "pla"),
                             "vignettes/PhEur/data/Corticotrophin.txt",
                             sep = "/"))
plaModel <- plaCRD(Data,
                   assayTitle =
                "PhEur: Corticotrophin; Subcutaneous Injection In Rats")
plaModel
plots    <- plot(plaModel, plots = "all", mfrow = c(3, 4))

# A few plots you cannot ask for in 'pla.plots' and 'plot':

cbbPalette <- c("#000000", "#009E73", "#e79f00", "#9ad0f3",
                "#0072B2", "#D55E00", "#CC79A7", "#F0E442")

pchs <- 14 + as.numeric(plots$data[,"Replicate"])
colors <- c("grey", "blue", "red")[as.numeric(plots$data[, "Sample"])]
colors <- colors <- c("grey", cbbPalette[2:3])[as.numeric(plots$data[, "Sample"])]

# Boxplot af residuals by replicate:
plot(Residual ~ factor(plots$data[,"Replicate"]), pch = pchs, col = colors,
     xlab = "Replicate", ylab = "Residuals, Restricted model", 
     cex.lab = 0.75, sub = "Restricted Model", data = plots$data)

# Boxplot of residuals by dose:
plot(Residual ~ factor(Z), pch = pchs, col = colors,
     xlab = "Dose", ylab = "Residuals, Restricted model", 
     cex.lab = 0.75, sub = "Restricted Model", data = plots$data)




