library(cg)


### Name: print.cgOneFactorFit
### Title: Print One Factor Model Fit object with some format options
### Aliases: print,cgOneFactorFit-method print.cgOneFactorFit

### ** Examples

data(canine)
canine.data <- prepareCGOneFactorData(canine, format="groupcolumns",
                                      analysisname="Canine",
                                      endptname="Prostate Volume",
                                      endptunits=expression(plain(cm)^3),
                                      digits=1, logscale=TRUE, refgrp="CC")
canine.fit <- fit(canine.data)

print(canine.fit)




