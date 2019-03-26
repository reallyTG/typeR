library(IPMRF)


### Name: ipmrf
### Title: IPM casewise with CART-RF by 'randomForest' for OOB samples
### Aliases: ipmrf
### Keywords: tree multivariate

### ** Examples

#Note: more examples can be found at 
#https://bmcbioinformatics.biomedcentral.com/articles/10.1186/s12859-017-1650-8

## Not run: 
##D 
##D library(mlbench)
##D #data used by Breiman, L.: Random forests. Machine Learning 45(1), 5--32 (2001)
##D data(PimaIndiansDiabetes2) 
##D Diabetes <- na.omit(PimaIndiansDiabetes2)
##D 
##D set.seed(2016)
##D require(randomForest)
##D ri<- randomForest(diabetes  ~ ., data=Diabetes, ntree=500, importance=TRUE,
##D keep.inbag=TRUE,replace = FALSE) 
##D 
##D #GVIM and PVIM (CART-RF)
##D im=importance(ri)
##D im
##D #rank
##D ii=apply(im,2,rank)
##D ii
##D 
##D #IPM based on CART-RF (randomForest package)
##D da=Diabetes[,1:8]
##D ntree=500
##D #IPM case-wise computed with OOB 
##D pupf=ipmrf(ri,da,ntree) 
##D 
##D #global IPM
##D pua=apply(pupf,2,mean) 
##D pua
##D 
##D #IPM by classes
##D attach(Diabetes)
##D puac=matrix(0,nrow=2,ncol=dim(da)[2])
##D puac[1,]=apply(pupf[diabetes=='neg',],2,mean) 
##D puac[2,]=apply(pupf[diabetes=='pos',],2,mean) 
##D colnames(puac)=colnames(da)
##D rownames(puac)=c( 'neg', 'pos')
##D puac
##D 
##D #rank IPM 
##D #global rank 
##D rank(pua) 
##D #rank by class
##D apply(puac,1,rank) 
## End(Not run)



