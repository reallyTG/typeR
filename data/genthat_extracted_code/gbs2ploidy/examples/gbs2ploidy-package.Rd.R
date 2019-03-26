library(gbs2ploidy)


### Name: gbs2ploidy-package
### Title: Inference of Ploidy from (Genotyping-by-Sequencing) GBS Data
### Aliases: gbs2ploidy-package gbs2ploidy
### Keywords: package

### ** Examples

## load a simulated data set
data(dat)
## Not run: 
##D ## obtain posterior estimates of allelic proportions; short chains are used for 
##D ## the example, we recommend increasing this to at least 1000 MCMC steps with a
##D ## 500 step burnin
##D props<-estprops(cov1=t(dat[[1]]),cov2=t(dat[[2]]),mcmc.steps=20,mcmc.burnin=5,
##D     mcmc.thin=2)
##D 
##D ## calculate observed heterozygosity and depth of coverage from the allele count
##D ## data
##D hx<-apply(is.na(dat[[1]]+dat[[2]])==FALSE,1,mean)
##D dx<-apply(dat[[1]]+dat[[2]],1,mean,na.rm=TRUE)
##D 
##D ## run estploidy without using known ploidy data
##D pl<-estploidy(alphas=props,het=hx,depth=dx,train=FALSE,pl=NA,set=NA,nclasses=2,
##D     ids=dat[[3]],pcs=1:2)
##D 
##D ## boxplots to visualize posterior assignment probabilities by true ploidy 
##D ## (which is known because these are simulated data)
##D boxplot(pl$pp[,1] ~ dat[[3]],ylab="assignment probability",xlab="ploidy")
##D 
##D ## run estploidy with a training data set with known ploidy; the data set is 
##D ## split into 100 individuals with known ploidy and 100 that are used for 
##D ## inference
##D truep<-dat[[3]]
##D trn<-sort(sample(1:200,100,replace=FALSE))
##D truep[-trn]<-NA
##D plt<-estploidy(alphas=props,het=hx,depth=dx,train=TRUE,pl=truep,set=trn,
##D     nclasses=2,ids=dat[[3]],pcs=1:2)
##D 
##D ## boxplots to visualize posterior assignment probabilities for individuals that
##D ## were not part of the training set by true ploidy (which is known because 
##D ## these are simulated data)
##D boxplot(plt$pp[,1] ~ dat[[3]][-trn],ylab="assignment probability",xlab="ploidy")
## End(Not run)



