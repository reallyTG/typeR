library(pgmm)


### Name: pgmmEM
### Title: Model-Based Clustering & Classification Using PGMMs
### Aliases: pgmmEM
### Keywords: multivariate cluster classif

### ** Examples

  ## Not run: 
##D # Wine clustering example with three random starts and the CUU model.
##D  data("wine")
##D  x<-wine[,-1]
##D  x<-scale(x)
##D  wine_clust<-pgmmEM(x,rG=1:4,rq=1:4,zstart=1,loop=3,modelSubset=c("CUU"))
##D  table(wine[,1],wine_clust$map)
##D 
##D # Wine clustering example with custom starts and the CUU model.
##D  data("wine")
##D  x<-wine[,-1]
##D  x<-scale(x)
##D  hcl<-hclust(dist(x)) 
##D  z<-list()
##D  for(g in 1:4){ 
##D 	 z[[g]]<-cutree(hcl,k=g)
##D  } 
##D  wine_clust2<-pgmmEM(x,1:4,1:4,zstart=3,modelSubset=c("CUU"),zlist=z)
##D  table(wine[,1],wine_clust2$map)
##D  print(wine_clust2)
##D  summary(wine_clust2)
##D 
##D # Olive oil classification by region (there are three regions), with two-thirds of
##D # the observations taken as having known group memberships, using the CUC, CUU and 
##D # UCU models. 
##D  data("olive") 
##D  x<-olive[,-c(1,2)] 
##D  x<-scale(x) 
##D  cls<-olive[,1]
##D  for(i in 1:dim(olive)[1]){
##D 	 if(i%%3==0){cls[i]<-0}
##D  }
##D  olive_class<-pgmmEM(x,rG=3:3,rq=4:6,cls,modelSubset=c("CUC","CUU", 
##D   "CUCU"),relax=TRUE)
##D  cls_ind<-(cls==0) 
##D  table(olive[cls_ind,1],olive_class$map[cls_ind])
##D 
##D # Another olive oil classification by region, but this time suppose we only know
##D # two-thirds of the labels for the first two areas but we suspect that there might 
##D # be a third or even a fourth area. 
##D  data("olive") 
##D  x<-olive[,-c(1,2)] 
##D  x<-scale(x) 
##D  cls2<-olive[,1]
##D  for(i in 1:dim(olive)[1]){
##D    if(i%%3==0||i>420){cls2[i]<-0}
##D  }
##D  olive_class2<-pgmmEM(x,2:4,4:6,cls2,modelSubset=c("CUU"),relax=TRUE)
##D  cls_ind2<-(cls2==0) 
##D  table(olive[cls_ind2,1],olive_class2$map[cls_ind2])
##D  
##D # Coffee clustering example using k-means starting values for all 12
##D # models with the ICL being used for model selection instead of the BIC.
##D  data("coffee")
##D  x<-coffee[,-c(1,2)]
##D  x<-scale(x)
##D  coffee_clust<-pgmmEM(x,rG=2:3,rq=1:3,zstart=2,icl=TRUE)
##D  table(coffee[,1],coffee_clust$map)
##D  plot(coffee_clust)
##D  plot(coffee_clust,onlyAll=TRUE)
##D   
## End(Not run)
  
# Coffee clustering example using k-means starting values for the UUU model, i.e., the
# mixture of factor analyzers model, for G=2 and q=1.
 data("coffee")
 x<-coffee[,-c(1,2)]
 x<-scale(x)
 coffee_clust_mfa<-pgmmEM(x,2:2,1:1,zstart=2,modelSubset=c("UUU"))
 table(coffee[,1],coffee_clust_mfa$map)
 


