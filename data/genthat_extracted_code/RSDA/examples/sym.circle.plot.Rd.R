library(RSDA)


### Name: sym.circle.plot
### Title: Symbolic Circle of Correlations
### Aliases: sym.circle.plot
### Keywords: Circle Symbolic

### ** Examples

data(oils)
res<-sym.interval.pca(oils,'centers')
sym.circle.plot(res$Sym.Prin.Correlations)




