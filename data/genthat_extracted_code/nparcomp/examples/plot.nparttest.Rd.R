library(nparcomp)


### Name: plot.nparttest
### Title: Visualizing the result of 'npar.t.test'
### Aliases: plot.nparttest
### Keywords: aplot

### ** Examples

data(impla)
a<-npar.t.test(impla~group, data = impla, method = "t.app",
               alternative = "two.sided", plot.simci=FALSE)
plot(a)



