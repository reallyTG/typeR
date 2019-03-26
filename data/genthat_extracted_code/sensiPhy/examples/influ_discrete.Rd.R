library(sensiPhy)


### Name: influ_discrete
### Title: Influential Species Detection - Trait Evolution Discrete
###   Characters
### Aliases: influ_discrete

### ** Examples

## Not run: 
##D #Load data:
##D data("primates")
##D #Create a binary trait factor 
##D adultMass_binary<-ifelse(primates$data$adultMass > 7350, "big", "small")
##D adultMass_binary<-as.factor(as.factor(adultMass_binary))
##D names(adultMass_binary)<-rownames(primates$data)
##D #Model trait evolution accounting for influential species
##D influ_binary<-influ_discrete(data = adultMass_binary,phy = primates$phy[[1]],
##D model = "SYM",transform = "none",cutoff = 2,n.cores = 2,track = TRUE)
##D #Print summary statistics
##D summary(influ_binary)
##D sensi_plot(influ_binary) #q12 and q21 are, as expected, exactly the same in symmetrical model. 
##D #Use a different evolutionary model. 
##D influ_binary2<-influ_discrete(data = adultMass_binary,phy = primates$phy[[1]],
##D model = "SYM",transform = "delta",n.cores = 2,track = TRUE)
##D summary(influ_binary2)
##D sensi_plot(influ_binary2)
##D #Or change the cutoff and transformation
##D influ_binary3<-influ_discrete(data = adultMass_binary,phy = primates$phy[[1]],
##D model = "ARD",transform = "none",cutoff = 1.2,n.cores = 2,track = TRUE)
##D summary(influ_binary3)
##D sensi_plot(influ_binary3) 
## End(Not run)



