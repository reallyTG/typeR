library(brainwaver)


### Name: efficiency
### Title: Graph efficiency
### Aliases: global.efficiency local.efficiency global.cost cost.evaluator
### Keywords: graphs

### ** Examples


data(brain)
brain<-as.matrix(brain)

# WARNING : To process only the first five regions
brain<-brain[,1:5]




n.regions<-dim(brain)[2]

#Construction of the correlation matrices for each level of the wavelet decomposition
wave.cor.list<-const.cor.list(brain, method = "modwt" ,wf = "la8", n.levels = 6, 
                               boundary = "periodic", p.corr = 0.975)


sup.seq<-((1:10)/10) #sequence of the correlation threshold 
nmax<-length(sup.seq)
Eglob<-matrix(0,6,nmax)
Eloc<-matrix(0,6,nmax)
Cost<-matrix(0,6,nmax)

n.levels<-6

#For each value of the correlation thrashold
for(i in 1:nmax){
n.sup<-sup.seq[i]

#Construction of the adjacency matrices associated to each level of the wavelet decomposition
wave.adj.list<-const.adj.list(wave.cor.list, sup = n.sup)


#For each level of the wavelet decomposition
for(j in 1:n.levels){

Eglob.brain<-global.efficiency(wave.adj.list[[j]],
			weight.mat=matrix(1,n.regions,n.regions))
Eglob[j,i]<-Eglob.brain$eff

Eloc.brain<-local.efficiency(wave.adj.list[[j]],
				weight.mat=matrix(1,n.regions,n.regions))
Eloc[j,i]<-Eloc.brain$eff

Cost.brain<-global.cost(wave.adj.list[[j]],
				weight.mat=matrix(1,n.regions,n.regions))
Cost[j,i]<-Cost.brain

}}


plot(sup.seq,(1:nmax)/2,type='n',xlab='Correlation threshold, R',ylab='Global efficiency',
     cex.axis=2,cex.lab=2,xlim=c(0,1),ylim=c(0,1))


for(i in 1:n.levels){
lines(sup.seq,Eglob[i,],type='l',col=i,lwd=2)
}
legend(x="topright",legend=c("Level 1","Level 2","Level 3","Level 4",
				"Level 5","Level 6"),fill=TRUE,col=(1:n.levels),lwd=2)





