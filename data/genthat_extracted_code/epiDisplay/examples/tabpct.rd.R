library(epiDisplay)


### Name: tabpct
### Title: Two-way tabulation with mosaic plot
### Aliases: tabpct
### Keywords: aplot

### ** Examples

data(Oswego)
.data <- Oswego
attach(.data)
agegr <- cut(age, breaks=c(0,20,40,60,80))
tabpct(agegr, ill)
tabpct(agegr, ill, cex.axis=1) # enlarge value labels
# To increase the size of the various titles:
tabpct(agegr, ill, cex.axis=1, main="", xlab="", ylab="", col=c("blue","purple"))
title(main="Diseased by Age group", cex.main=1.8,
    xlab="Age (years)",ylab="Diseased", cex.lab=1.5)
detach(.data)
rm(list=ls())    



