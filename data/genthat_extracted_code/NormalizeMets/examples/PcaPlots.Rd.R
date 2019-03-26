library(NormalizeMets)


### Name: PcaPlots
### Title: PCA plots
### Aliases: PcaPlots

### ** Examples


    data(mixdata)
    
    # produce all results
    PcaPlots(mixdata$featuredata,mixdata$sampledata[,3],multiplot = TRUE, 
    varplot = TRUE, interactiveplots = TRUE)
    
    # return a list of the ineractive plots only
    interactive.pca <- PcaPlots(mixdata$featuredata,mixdata$sampledata[,3],
    interativeonly = TRUE, interactiveplots = TRUE,
    userinput = FALSE, returninteractive = TRUE)
    




