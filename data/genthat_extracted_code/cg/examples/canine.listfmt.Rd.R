library(cg)


### Name: canine.listfmt
### Title: Canine Data Set in the cg package
### Aliases: canine.listfmt
### Keywords: datasets

### ** Examples

data(canine.listfmt)
str(canine.listfmt)

## Analogous to prepareCGOneFactorData call on canine data frame format,
## subsequent methods will work for canine.listfmt.data:

canine.listfmt.data <- prepareCGOneFactorData(canine.listfmt, format="listed",
                                              analysisname="Canine",
                                              endptname="Prostate Volume",
                                              endptunits=expression(plain(cm)^3),
                                              digits=1, logscale=TRUE,
                                              refgrp="CC")
## as they do on canine.data:

canine.data <- prepareCGOneFactorData(canine, format="groupcolumns",
                                      analysisname="Canine",
                                      endptname="Prostate Volume",
                                      endptunits=expression(plain(cm)^3),
                                      digits=1, logscale=TRUE, refgrp="CC")



