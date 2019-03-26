library(GSA)


### Name: GSA
### Title: Gene set analysis
### Aliases: GSA
### Keywords: univar survival ts nonparametric

### ** Examples


######### two class unpaired comparison
# y must take values 1,2

set.seed(100)
x<-matrix(rnorm(1000*20),ncol=20)
dd<-sample(1:1000,size=100)

u<-matrix(2*rnorm(100),ncol=10,nrow=100)
x[dd,11:20]<-x[dd,11:20]+u
y<-c(rep(1,10),rep(2,10))


genenames=paste("g",1:1000,sep="")

#create some random gene sets
genesets=vector("list",50)
for(i in 1:50){
 genesets[[i]]=paste("g",sample(1:1000,size=30),sep="")
}
geneset.names=paste("set",as.character(1:50),sep="")

GSA.obj<-GSA(x,y, genenames=genenames, genesets=genesets,  resp.type="Two class unpaired", nperms=100)


GSA.listsets(GSA.obj, geneset.names=geneset.names,FDRcut=.5)



#to use  "real" gene set collection, we read it in from a gmt file:
# 
# geneset.obj<- GSA.read.gmt("file.gmt")
# 
# where file.gmt is a gene set collection from GSEA collection or
#  or the website http://www-stat.stanford.edu/~tibs/GSA, or one
# that you have created yourself. Then

#   GSA.obj<-GSA(x,y, genenames=genenames, genesets=geneset.obj$genesets,  resp.type="Two class unpaired", nperms=100)
#
#






