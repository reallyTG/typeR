library(brainwaver)


### Name: choose.thresh.nbedges
### Title: Threshold associated to a given number of edges.
### Aliases: choose.thresh.nbedges
### Keywords: graphs

### ** Examples

data(brain)
brain<-as.matrix(brain)
# WARNING : To process only the first five regions
brain<-brain[,1:5]

#Construction of the correlation matrices for each level of the wavelet decomposition
wave.cor.list<-const.cor.list(brain, method = "modwt" ,wf = "la8", n.levels = 6,
                               boundary = "periodic", p.corr = 0.975)

#Construction of the adjacency matrice for scale 4

adj.mat.4<-const.adj.mat(wave.cor.list[[4]], sup = 0.44,proc.length=dim(brain)[1], 
                          num.levels=4)
nb.edges<-sum(adj.mat.4)/2

sup.thresh<-choose.thresh.nbedges(wave.cor.list[[4]],nb.edges=nb.edges,
                         proc.length=dim(brain)[1],num.levels=4)




