library(cg)


### Name: show.cgOneFactorGlobalTest
### Title: Show a Global Test object from the cg package
### Aliases: show.cgOneFactorGlobalTest show,cgOneFactorGlobalTest-method

### ** Examples

data(canine)
canine.data <- prepareCGOneFactorData(canine, format="groupcolumns",
                                      analysisname="Canine",
                                      endptname="Prostate Volume",
                                      endptunits=expression(plain(cm)^3),
                                      digits=1, logscale=TRUE, refgrp="CC")
canine.fit <- fit(canine.data)
globalTest(canine.fit, display="show")
show(globalTest(canine.fit, display="none"))



