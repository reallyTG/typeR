library(cg)


### Name: showObj.cgOneFactorFit
### Title: Show a Fitted Model object from the cg package
### Aliases: showObj.cgOneFactorFit showObj,cgOneFactorFit-method

### ** Examples

data(canine)
canine.data <- prepareCGOneFactorData(canine, format="groupcolumns",
                                      analysisname="Canine",
                                      endptname="Prostate Volume",
                                      endptunits=expression(plain(cm)^3),
                                      digits=1, logscale=TRUE, refgrp="CC")
canine.fit <- fit(canine.data)

showObj(canine.fit)

show(canine.fit) ## alias for print method on the object 



