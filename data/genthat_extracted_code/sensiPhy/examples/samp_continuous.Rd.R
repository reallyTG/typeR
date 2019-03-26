library(sensiPhy)


### Name: samp_continuous
### Title: Species Sampling uncertainty - Trait Evolution Continuous
###   Characters
### Aliases: samp_continuous

### ** Examples

## Don't show: 
#Load data:
data("primates")
#Model trait evolution accounting for phylogenetic uncertainty
adultMass<-primates$data$adultMass
names(adultMass)<-rownames(primates$data)
samp_cont<-samp_continuous(data = adultMass,phy = primates$phy[[1]],
model = "BM",n.sim=1,breaks=c(.1,.2),n.cores = 2, track = TRUE)
## End(Don't show)
## Not run: 
##D #Load data:
##D data("primates")
##D #Model trait evolution accounting for sampling size 
##D adultMass<-primates$data$adultMass
##D names(adultMass)<-rownames(primates$data)
##D samp_cont<-samp_continuous(data = adultMass,phy = primates$phy[[1]],
##D model = "OU",n.sim=25,breaks=seq(.05,.2,.05),n.cores = 2, track = TRUE)
##D #Print summary statistics
##D summary(samp_cont)
##D sensi_plot(samp_cont)
##D sensi_plot(samp_cont, graphs = 1)
##D #Use a different evolutionary model 
##D samp_cont2<-samp_continuous(data = adultMass,phy = primates$phy[[1]],
##D model = "kappa",n.sim=25,breaks=seq(.05,.2,.05),n.cores = 2,track = TRUE)
##D summary(samp_cont2)
##D sensi_plot(samp_cont2)
##D sensi_plot(samp_cont2, graphs = 2)
##D samp_cont3<-samp_continuous(data = adultMass,phy = primates$phy[[1]],
##D model = "BM",n.sim=25,breaks=seq(.05,.2,.05),n.cores = 2,track = TRUE)
##D summary(samp_cont3)
## End(Not run)



