library(cg)


### Name: globalTest.cgOneFactorFit
### Title: Perform a global Test of significance with cgOneFactorFit object
### Aliases: globalTest.cgOneFactorFit globalTest,cgOneFactorFit-method
###   cgOneFactorGlobalTest-class cgOneFactorGlobalTest

### ** Examples

data(canine)
canine.data <- prepareCGOneFactorData(canine, format="groupcolumns",
                                      analysisname="Canine",
                                      endptname="Prostate Volume",
                                      endptunits=expression(plain(cm)^3),
                                      digits=1, logscale=TRUE, refgrp="CC")
canine.fit <- fit(canine.data)

canine.globalTest <- globalTest(canine.fit)

globalTest(canine.fit, model="both")

globalTest(canine.fit, model="olsonly")

globalTest(canine.fit, model="rronly")


data(gmcsfcens)
gmcsfcens.data <- prepareCGOneFactorData(gmcsfcens, format="groupcolumns",
                                         analysisname="cytokine",
                                         endptname="GM-CSF (pg/ml)",
                                         logscale=TRUE)

gmcsfcens.fit <- fit(gmcsfcens.data, type="aft")

globalTest(gmcsfcens.fit)




