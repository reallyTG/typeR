library(NormalizeMets)


### Name: HeatMap
### Title: Heat map
### Aliases: HeatMap

### ** Examples


    data(mixdata)  #unadjusted data
    HeatMap(mixdata$featuredata,mixdata$sampledata[,1], 
             saveplot = FALSE, 
            interactiveplot = TRUE, scale = "row", 
            dendrogram = "none", colramp=c(75,"magenta","green"))




