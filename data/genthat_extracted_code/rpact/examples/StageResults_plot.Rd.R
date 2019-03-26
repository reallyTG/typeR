library(rpact)


### Name: StageResults_plot
### Title: Stage Results Plotting - Conditional Power Plot
### Aliases: StageResults_plot plot.StageResults

### ** Examples


design <- getDesignGroupSequential(kMax = 4, alpha = 0.025, 
    informationRates = c(0.2, 0.5, 0.8, 1), 
    typeOfDesign = "WT", deltaWT = 0.25)

dataExample <- getDataset(
    n = c(20, 30, 30),
    means = c(50, 51, 55),
    stDevs = c(130, 140, 120)
)

stageResults <- getStageResults(design, dataExample, thetaH0 = 20)

if (require(ggplot2)) plot(stageResults, nPlanned = c(30), thetaRange = c(0, 100))




