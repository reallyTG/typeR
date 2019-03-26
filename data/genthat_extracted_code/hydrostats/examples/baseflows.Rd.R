library(hydrostats)


### Name: baseflows
### Title: Measures of central tendency and baseflow via the Lynne-Hollick
###   (LH) baseflow filter
### Aliases: baseflows

### ** Examples

data(Acheron)
Acheron<-ts.format(Acheron)

baseflows(Acheron,a=0.975, ts="mean")
baseflows(Acheron,a=0.975, ts="annual")
head(baseflows(Acheron,a=0.975, ts="daily"))





