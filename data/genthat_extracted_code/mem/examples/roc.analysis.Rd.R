library(mem)


### Name: roc.analysis
### Title: Analysis of different indicators to find the optimum value of
###   the window parameter
### Aliases: roc.analysis
### Keywords: influenza

### ** Examples

# Castilla y Leon Influenza Rates data
data(flucyl)
# ROC analysis
epi.roc<-roc.analysis(flucyl,i.param.values=seq(2.6,2.8,0.1),i.detection.values=seq(2.6,2.8,0.1))
epi.roc$results




