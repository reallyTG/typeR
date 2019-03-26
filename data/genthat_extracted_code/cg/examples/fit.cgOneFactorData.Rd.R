library(cg)


### Name: fit.cgOneFactorData
### Title: Fit models to a cgOneFactorData object
### Aliases: fit.cgOneFactorData fit,cgOneFactorData-method
###   cgOneFactorFit-class cgOneFactorFit
### Keywords: models

### ** Examples

data(canine)
canine.data <- prepareCGOneFactorData(canine, format="groupcolumns",
                                      analysisname="Canine",
                                      endptname="Prostate Volume",
                                      endptunits=expression(plain(cm)^3),
                                      digits=1, logscale=TRUE, refgrp="CC")
									  
canine.fit <- fit(data=canine.data, type="rr")


data(gmcsfcens)
gmcsfcens.data <- prepareCGOneFactorData(gmcsfcens, format="groupcolumns",
                                         analysisname="cytokine",
                                         endptname="GM-CSF (pg/ml)",
                                         logscale=TRUE)

gmcsfcens.fit <- fit(gmcsfcens.data, type="aft")



