library(pla)


### Name: data2assayFrame
### Title: Check dataframe for pla.fit
### Aliases: data2assayFrame
### Keywords: mich

### ** Examples


# Example 1:

require(graphics)
Dilution  <- 2 + log(ToothGrowth["dose"]) / log(2)
names(Dilution) <- "Dilution"
Replicate <- rep(1:10, 6)
Data      <- cbind(ToothGrowth, Replicate, Dilution)
dimnames(Data)[[2]] <- c("Response", "Sample", "Dose", "Replicate", "Dilution")
Design    <- "crd"
Frame     <- data2assayFrame(Data, dr = 2, design = Design)
Fits      <- pla.fit(Frame, sampleLabels = c("VC", "OJ"), dr = 2,
                     design = Design, main = "ToothGrowth", show = TRUE)
pla.plots(Frame, design = Design,
          sampleLabels = c("VC", "OJ"), main = "ToothGrowth")

# Example 2:

data(AgarDiffusionAssay)

# Agar   <- read.table("./pla/vignettes/PhEur/data/AntibioticAgarDiffusionAssay.txt",
#                      header = TRUE)
Agar     <- AgarDiffusionAssay
Design   <- "lsd"
select   <- c("Row", "Column", "Sample", "Dilution", "Response")
Frame    <- data2assayFrame(Agar[, select])

fits   <- pla.fit(Frame, design = Design, sampleLabels = c("S", "T"),
                  dr = 1.5, returnPotencyEstimates = TRUE)

## Alternative on object of class 'pla':

plaModel <- plaLSD(Agar)
Fits <- fit(plaModel)



