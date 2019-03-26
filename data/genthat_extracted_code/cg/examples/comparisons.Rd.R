library(cg)


### Name: comparisons
### Title: Create a table of comparisons amongst groups
### Aliases: comparisons

### ** Examples

data(canine)
canine.data <- prepareCGOneFactorData(canine, format="groupcolumns",
                                      analysisname="Canine",
                                      endptname="Prostate Volume",
                                      endptunits=expression(plain(cm)^3),
                                      digits=1, logscale=TRUE, refgrp="CC")

canine.fit <- fit(canine.data)


## Easier way: notice the comparisonsTable call

comparisonsTable(canine.fit, model="olsonly")

## Manual way
## Instead of comparisonsTable(canine.fit, model="olsonly")

comparisons(estimates=canine.fit@olsfit$coef,
            varcovmatrix=vcov(canine.fit@olsfit),
            errordf=canine.fit@olsfit$df.residual,
            endptscale="log",
            analysisname="Canine",
            digits=1,
            endptname="Prostate Volume")



