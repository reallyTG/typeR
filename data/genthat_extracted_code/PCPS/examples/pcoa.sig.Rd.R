library(PCPS)


### Name: pcoa.sig
### Title: Significant dimensions in principal coordinate analysis
### Aliases: pcoa.sig print.pcoasig summary.pcoasig print.summarypcoasig
###   print.pcoasig print.summarypcoasig summary.pcoasig
### Keywords: PCPS

### ** Examples


data(flona)
res<-pcoa.sig(flona$community, method = "bray", squareroot = TRUE, axis = 6, iterations = 100)
res
summary(res)$scores




