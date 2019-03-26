library(brainwaver)


### Name: const.adj.list
### Title: Computation of the list of adjacency matrices
### Aliases: const.adj.list
### Keywords: graphs ts multivariate

### ** Examples

data(brain)
brain<-as.matrix(brain)
# WARNING : To process only the first five regions
brain<-brain[,1:5]


# Construction of the correlation matrices for each level of the wavelet decomposition
wave.cor.list<-const.cor.list(brain, method = "modwt" ,wf = "la8", n.levels = 6, 
                               boundary = "periodic", p.corr = 0.975)

# Construction of the adjacency matrices associated to each level of the 
# wavelet decomposition
wave.adj.list<-const.adj.list(wave.cor.list, sup = 0.44, proc.length=dim(brain)[1])

par(mfrow=c(3,2))

for(i in 1:4)
{
name.txt<-paste("Level ",i,sep="")
image(wave.adj.list[[i]],col=gray((0:20)/20),main=name.txt)
}




