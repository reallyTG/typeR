library(gbs2ploidy)


### Name: estprops
### Title: Estimate allelic proportions
### Aliases: estprops

### ** Examples


## load a simulated data set
data(dat)
## Not run: 
##D ## obtain posterior estimates of allelic proportions; short chains are used for 
##D ## the example, we recommend increasing this to at least 1000 MCMC steps with a 
##D ## 500 step burnin
##D props<-estprops(cov1=t(dat[[1]]),cov2=t(dat[[2]]),mcmc.steps=20,mcmc.burnin=5,
##D     mcmc.thin=1)
##D 
##D ## plot point estimates and 95##D 
##D ## allelic proportions for the first nine individuals
##D par(mfrow=c(3,3))
##D for(i in 1:9){
##D     plot(props[[i]][,3],ylim=c(0,1),axes=FALSE,xlab="ratios",ylab="proportions")
##D 	axis(1,at=1:5,c("1:3","1:2","1:1","2:1","3:1"))
##D 	axis(2)
##D 	box()
##D 	segments(1:5,props[[i]][,1],1:5,props[[i]][,5])
##D 	title(main=paste("true ploidy =",dat[[3]][i]))
##D }
## End(Not run)



