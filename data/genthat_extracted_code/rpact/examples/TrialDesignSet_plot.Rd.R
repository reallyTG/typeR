library(rpact)


### Name: TrialDesignSet_plot
### Title: Trial Design Set Plotting
### Aliases: TrialDesignSet_plot plot.TrialDesignSet

### ** Examples


design <- getDesignInverseNormal(kMax = 3, alpha = 0.025, 
    typeOfDesign = "asKD", gammaA = 2, 
    informationRates = c(0.2, 0.7, 1), typeBetaSpending = "bsOF")
 
# Create a set of designs based on the master design defined above 
# and varied parameter 'gammaA'
designSet <- getDesignSet(design = design, gammaA = 4)
  
if (require(ggplot2)) plot(designSet, type = 1, legendPosition = 6)




