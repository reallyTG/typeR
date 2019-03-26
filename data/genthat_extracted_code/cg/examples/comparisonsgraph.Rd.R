library(cg)


### Name: comparisonsgraph
### Title: Create an graph of comparisons
### Aliases: comparisonsgraph

### ** Examples

data(canine)
canine.data <- prepareCGOneFactorData(canine, format="groupcolumns",
                                      analysisname="Canine",
                                      endptname="Prostate Volume",
                                      endptunits=expression(plain(cm)^3),
                                      digits=1, logscale=TRUE, refgrp="CC")
canine.fit <- fit(canine.data)
canine.comps <- comparisonsTable(canine.fit)

## Easier way: notice the camel-case of the comparisonsGraph call

comparisonsGraph(canine.comps, model="olsonly")

## Manual way
## Instead of comparisonsGraph(canine.comps, model="olsonly")

canine.compstable <- comparisons(estimates=canine.fit@olsfit$coef,
                                 varcovmatrix=vcov(canine.fit@olsfit),
                                 errordf=canine.fit@olsfit$df.residual,
                                 endptscale="log",
                                 analysisname="Canine",
                                 digits=1,
                                 endptname="Prostate Volume")

comparisonsgraph(canine.compstable,
                 difftype="percent",
                 analysisname="Canine",
                 digits=1,
                 endptname=expression(paste( plain('Prostate Volume'),
                                      ' (', plain(cm)^3  ,  ')' ))  
                ) 



