library(PedCNV)


### Name: plot.clust
### Title: Plots clustering result
### Aliases: plot.clust

### ** Examples

# Fit the data under the given clustering numbers
clus.fit <- ClusProc(signal=signal,N=2:6,varSelection='PC.9')
plot(clus.fit,type='histo')



