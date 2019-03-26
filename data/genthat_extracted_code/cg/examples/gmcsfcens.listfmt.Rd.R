library(cg)


### Name: gmcsfcens.listfmt
### Title: GM-CSF censored data set in the cg package
### Aliases: gmcsfcens.listfmt gmcsfcens.listfmt1 gmcsfcens.listfmt2
###   gmcsfcens.listfmt3
### Keywords: datasets

### ** Examples

data(gmcsfcens.listfmt1)
str(gmcsfcens.listfmt1)

data(gmcsfcens.listfmt2)
str(gmcsfcens.listfmt2)

data(gmcsfcens.listfmt3)
str(gmcsfcens.listfmt3)

## Analogous to prepareCGOneFactorData call on gmcsfcens data frame format,
##  subsequent methods will work for gmcsfcens.listfmt.data objects below:

## leftcensor argument can be left as default NULL
gmcsfcens.listfmt1.data <- prepareCGOneFactorData(gmcsfcens.listfmt1, format="listed",
                                                  analysisname="cytokine",
                                                  endptname="GM-CSF (pg/ml)",
                                                  logscale=TRUE)

## leftcensor=TRUE argument needs to be set
gmcsfcens.listfmt2.data <- prepareCGOneFactorData(gmcsfcens.listfmt2, format="listed",
                                                  analysisname="cytokine",
                                                  endptname="GM-CSF (pg/ml)",
                                                  logscale=TRUE,
                                                  leftcensor=TRUE)

## leftcensor argument can be left as default NULL
gmcsfcens.listfmt3.data <- prepareCGOneFactorData(gmcsfcens.listfmt3, format="listed",
                                                  analysisname="cytokine",
                                                  endptname="GM-CSF (pg/ml)",
                                                  logscale=TRUE)
## as they do on gmcsfcens.data:

gmcsfcens.data <- prepareCGOneFactorData(gmcsfcens, format="groupcolumns",
                                         analysisname="cytokine",
                                         endptname="GM-CSF (pg/ml)",
                                         logscale=TRUE)




