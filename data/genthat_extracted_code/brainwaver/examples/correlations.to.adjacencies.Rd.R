library(brainwaver)


### Name: correlations.to.adjacencies
### Title: Produce adjencency matrices for a given number of edges
### Aliases: correlations.to.adjacencies ideal.wavelet.levels distance
### Keywords: multivariate ts

### ** Examples


data(brain)
brain<-as.matrix(brain)
# WARNING : To process only the first five regions
brain<-brain[,1:5]

n.levels<-4
wave.cor.list<-const.cor.list(brain,n.levels=n.levels)
adj.mat<-correlations.to.adjacencies(wave.cor.list,edge.func=(function(x){x*log(x)}))





