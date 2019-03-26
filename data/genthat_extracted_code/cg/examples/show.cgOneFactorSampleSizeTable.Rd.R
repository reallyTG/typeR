library(cg)


### Name: show.cgOneFactorSampleSizeTable
### Title: Show a One Factor Sample Size Table object from the cg package
### Aliases: show,cgOneFactorSampleSizeTable-method
###   show.cgOneFactorSampleSizeTable

### ** Examples

data(canine)
canine.data <- prepareCGOneFactorData(canine, format="groupcolumns",
                                      analysisname="Canine",
                                      endptname="Prostate Volume",
                                      endptunits=expression(plain(cm)^3),
                                      digits=1, logscale=TRUE, refgrp="CC")
canine.fit <- fit(canine.data)
show(samplesizeTable(canine.fit, direction="increasing", 
                     mmdvec=c(25, 50, 75, 100), display="none"))



