library(clinDR)


### Name: plot.plotB
### Title: Plot Bayes dose response curve and dose group means
### Aliases: plot.plotB
### Keywords: nonlinear hplot

### ** Examples

## Not run: 
##D data("examples14")
##D exdat<-examples14[[6]]
##D 
##D prior<-prior.control(epmu=0,epsd=10,emaxmu=0,emaxsd=10,p50=0.25,
##D 				sigmalow=0.01,sigmaup=3)
##D mcmc<-mcmc.control(chains=3)
##D 
##D fitout<-fitEmaxB(exdat$y,exdat$dose,prior,modType=4,prot=exdat$prot,
##D 				count=exdat$nsize,msSat=(exdat$sd)^2,mcmc=mcmc)
##D parms<-coef(fitout)[1:4]   ### use first intercept
##D 
##D outB<-plotB(exdat$y,exdat$dose,parms, sigma2=(sigma(fitout))^2,
##D 			ylab="Change in EDD")
##D 			
##D plot(outB,plotDif=TRUE)
## End(Not run)
## Don't show: 
data("examples14")
exdat<-examples14[[6]]

parms<-matrix(c(-0.1665350, 0.3657811, -5.660137, 1.744753, 0.4050860,
-0.8463137, 0.3837361, -4.877676, 1.784098, 0.3943782,
-1.1811274, 0.3767222, -4.921861, 1.873861, 0.4266011,
 0.4729616, 0.3157714, -6.322768, 1.780517, 0.3646588,
 0.4255880, 0.3336959, -6.251558, 1.775438, 0.3657461),ncol=5,byrow=TRUE)

outB<-plotB(exdat$y,exdat$dose,parms[,1:4], sigma2=(parms[,5])^2,
			ylab="Change in EDD")
			
plot(outB,plotDif=TRUE)
## End(Don't show)



