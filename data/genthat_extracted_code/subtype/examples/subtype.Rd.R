library(subtype)


### Name: subtype
### Title: Cluster analysis to find molecular subtypes and their assessment
### Aliases: subtype

### ** Examples


set.seed(1234)
p<-100   #num.variables
n1<-5    #number of sample in population 1
n2<-5    #num.samples from population 2 

group<-c(rep(1,length.out=n1),rep(2,length.out=n2))
data<-matrix(rnorm((n1+n2)*p),(n1+n2),p)

############################

dimnames(data)[[1]]<-as.character(paste("P",runif(nrow(data),0,1),sep="")) ### making row names
dimnames(data)[[2]]<-as.character(paste("G",runif(ncol(data),0,1),sep="")) ### making column names

### The following procedure takes ~ 1 minute.
A=subtype(
   GEset = t(data),
   outcomeLabels = group,
   Npermutes = 2, 
   Nchunks = 5, 
   NclustersASet = 3,
   seed=1234
)

summary(A,f.out=0)  ### f.out can be used for filtering out uninteresting subtypes. e.g. if f.out=2, we ignore subtypes having N01_0<=2.




