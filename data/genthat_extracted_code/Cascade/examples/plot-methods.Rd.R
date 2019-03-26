library(Cascade)


### Name: plot-methods
### Title: Plot
### Aliases: plot-methods plot,ANY,ANY-method plot,micro_array,ANY-method
###   plot,network,ANY-method plot,micropredict,ANY-method
### Keywords: methods

### ** Examples

data(simul)
plot(Net)
plot(M)

data(Selection)
data(network)
nv<-0.11
plot(network,choice="network",gr=Selection@group,nv=nv,label_v=Selection@name,
edge.arrow.size=0.9,edge.thickness=1.5)



