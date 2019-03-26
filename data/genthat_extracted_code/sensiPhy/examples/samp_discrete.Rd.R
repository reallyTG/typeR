library(sensiPhy)


### Name: samp_discrete
### Title: Species Sampling uncertainty - Trait Evolution Discrete
###   Characters
### Aliases: samp_discrete

### ** Examples

## Don't show: 
#Load data:
data("primates")
#Create a binary trait factor 
adultMass_binary<-ifelse(primates$data$adultMass > 7350, "big", "small")
adultMass_binary<-as.factor(as.factor(adultMass_binary))
names(adultMass_binary)<-rownames(primates$data)
#Model trait evolution accounting for phylogenetic uncertainty
samp_binary<-samp_discrete(data = adultMass_binary,phy = primates$phy[[1]],
n.sim=1,breaks=c(.1,.2),model = "SYM",transform = "none",n.cores = 2,track = TRUE)
## End(Don't show)
## Not run: 
##D #Load data:
##D data("primates")
##D #Create a binary trait factor 
##D adultMass_binary<-ifelse(primates$data$adultMass > 7350, "big", "small")
##D adultMass_binary<-as.factor(as.factor(adultMass_binary))
##D names(adultMass_binary)<-rownames(primates$data)
##D #Model trait evolution accounting for sampling size 
##D samp_binary<-samp_discrete(data = adultMass_binary,phy = primates$phy[[1]],
##D n.sim=25,breaks=seq(.1,.3,.1),model = "SYM",transform = "none",n.cores = 2,track = TRUE)
##D #Print summary statistics
##D summary(samp_binary)
##D sensi_plot(samp_binary)
##D sensi_plot(samp_binary,graphs=1)
##D sensi_plot(samp_binary,graphs=2)
##D #Use a different evolutionary model or transformation 
##D samp_binary2<-samp_discrete(data = adultMass_binary,phy = primates$phy[[1]],
##D n.sim=25,breaks=seq(.1,.3,.1),model = "ARD",transform = "lambda",n.cores = 2,track = TRUE)
##D summary(samp_binary2)
##D sensi_plot(samp_binary2)
##D sensi_plot(samp_binary2,graphs=1)
##D sensi_plot(samp_binary2,graphs=3)
## End(Not run)



