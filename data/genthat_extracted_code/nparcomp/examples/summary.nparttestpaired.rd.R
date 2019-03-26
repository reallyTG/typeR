library(nparcomp)


### Name: summary.nparttestpaired
### Title: Summary of 'npar.t.test'
### Aliases: summary.nparttestpaired
### Keywords: print

### ** Examples

data(PGI)
a<-npar.t.test.paired(PGIscore~timepoint, data = PGI, 
               alternative = "two.sided", info=FALSE, plot.simci=FALSE)
summary(a)




