library(cg)


### Name: errorbargraph
### Title: Create an error bar graph based on pairwise multiple comparisons
### Aliases: errorbargraph

### ** Examples

data(canine)
canine.data <- prepareCGOneFactorData(canine, format="groupcolumns",
                                      analysisname="Canine",
                                      endptname="Prostate Volume",
                                      endptunits=expression(plain(cm)^3),
                                      digits=1, logscale=TRUE, refgrp="CC")
canine.fit <- fit(canine.data)

## Easier way: notice the camel case of the errorBarGraph call
errorBarGraph(canine.fit, model="olsonly")

## Manual way
## Instead of errorBarGraph(canine.fit, model="olsonly")
errorbargraph(estimates=canine.fit@olsfit$coef,
              centralvar=((summary(canine.fit@olsfit)$sigma^2) /
                          unique(sapply(canine, length))),
              critpoint=qt(0.975, df=canine.fit@olsfit$df.residual),
              endptscale="log",
              analysisname="Canine",
              digits=1,
              endptname=expression(paste( plain('Prostate Volume'),
                                      ' (', plain(cm)^3  ,  ')' ))
              )
              



