library(MetNorm)


### Name: NormalizeRUVRand
### Title: RUV-random normalized data
### Aliases: NormalizeRUVRand

### ** Examples

data(UV)
Y<-data.matrix(UV[,-c(1:3)]) 

##Empirical controls
IS<-Y[,which(colnames(Y)=="IS")] 
r<-numeric(dim(Y)[2])
for(j in 1:length(r)){
  r[j]<-cor(IS,Y[,j])
}
ctl<-logical(length(r))
ctl[which(r>round(quantile(r,0.7),2))]<-TRUE 

## Not run: 
##D   
##D ruv<-NormalizeRUVRand(Y=Y,ctl=ctl,k=3) 
##D ruvclust<-NormalizeRUVRandClust(RUVRand=ruv,
##D                    maxIter=200, 
##D                    nUpdate=100,
##D                    lambdaUpdate=TRUE,
##D                    p=2)
##D ruvclustY<-ruvclust$newY
##D pairs(princomp(ruvclustY,cor=TRUE)$scores[,c(1:3)],
##D       pch=as.numeric(UV[,2]), col=UV[,3],
##D       main="RUV random for clustering")
## End(Not run)



