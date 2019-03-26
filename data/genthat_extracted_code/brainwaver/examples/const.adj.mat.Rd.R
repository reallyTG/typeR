library(brainwaver)


### Name: const.adj.mat
### Title: Computation of the adjacency matrix
### Aliases: const.adj.mat
### Keywords: graphs ts multivariate

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

image(adj.mat.4,col=gray((0:20)/20))



