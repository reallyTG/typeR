library(brainwaver)


### Name: small.world
### Title: Computation of some quantitive parameters given in the framework
###   of the small-world graph theory.
### Aliases: small.world
### Keywords: graphs

### ** Examples

# fig 3 of Achard (2006)


data(brain)
brain<-as.matrix(brain)

# WARNING : To process only the first five regions
brain<-brain[,1:5]



#Construction of the correlation matrices for each level of the wavelet decomposition
wave.cor.list<-const.cor.list(brain, method = "modwt" ,wf = "la8", n.levels = 6, 
                               boundary = "periodic", p.corr = 0.975)

sup.seq<-((1:10)/10) #sequence of the correlation threshold 
nmax<-length(sup.seq)
in.degree.mean<-matrix(0,6,nmax)
n.levels<-6

#For each value of the correlation thrashold
for(i in 1:nmax){
n.sup<-sup.seq[i]

#Construction of the adjacency matrices associated to each level of the wavelet decomposition
wave.adj.list<-const.adj.list(wave.cor.list, sup = n.sup, proc.length=dim(brain)[1])


#For each level of the wavelet decomposition
for(j in 1:n.levels){

param.sw.brain<-small.world(wave.adj.list[[j]],dat="reduced")
in.degree.mean[j,i]<-param.sw.brain$in.degree.mean

}}

#Plots of the average in-degree in terms of the scale

n.regions<-dim(brain)[2]

plot(sup.seq,(1:nmax)/2,type='n',xlab='Correlation threshold, R',ylab='Mean degree, k',
     cex.axis=2,cex.lab=2,xlim=c(0,1),ylim=c(0,90))


for(i in 1:n.levels){
lines(sup.seq,in.degree.mean[i,],type='l',col=i,lwd=2)
}
lines(sup.seq,rep(log(n.regions),nmax))
legend(x="topright",legend=c("Level 1","Level 2","Level 3","Level 4",
				"Level 5","Level 6"),col=(1:n.levels),lwd=2)








