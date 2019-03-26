library(cg)


### Name: print.cgOneFactorGlobalTest
### Title: Print One Factor Global F-test object with some format options
### Aliases: print,cgOneFactorGlobalTest-method print.cgOneFactorGlobalTest

### ** Examples

data(canine)
canine.data <- prepareCGOneFactorData(canine, format="groupcolumns",
                                      analysisname="Canine",
                                      endptname="Prostate Volume",
                                      endptunits=expression(plain(cm)^3),
                                      digits=1, logscale=TRUE, refgrp="CC")
canine.fit <- fit(canine.data)

canine.global <- globalTest(canine.fit)

print(canine.global)





