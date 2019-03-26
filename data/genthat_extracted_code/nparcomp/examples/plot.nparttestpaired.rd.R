library(nparcomp)


### Name: plot.nparttestpaired
### Title: Visualizing the result of 'npar.t.test.paired'
### Aliases: plot.nparttestpaired
### Keywords: aplot

### ** Examples

data(PGI)
a<-npar.t.test.paired(PGIscore~timepoint, data = PGI, 
               alternative = "two.sided", info=TRUE, plot.simci=FALSE)
plot(a)



