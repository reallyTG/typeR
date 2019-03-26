library(rpact)


### Name: TrialDesign_plot
### Title: Trial Design Plotting
### Aliases: TrialDesign_plot plot.TrialDesign

### ** Examples


design <- getDesignInverseNormal(kMax = 3, alpha = 0.025, 
    typeOfDesign = "asKD", gammaA = 2, 
    informationRates = c(0.2, 0.7, 1), 
    typeBetaSpending = "bsOF")

if (require(ggplot2)) {
    plot(design) # default: type = 1
    plot(design, type = 2, nMax = 20, theta = seq(0, 1, 0.05))
    plot(design, type = 3)
    plot(design, type = 4, nMax = 20, theta = seq(0, 1, 0.05))
    plot(design, type = 5, nMax = 20, theta = seq(0, 1, 0.05))
    plot(design, type = 6)
}




