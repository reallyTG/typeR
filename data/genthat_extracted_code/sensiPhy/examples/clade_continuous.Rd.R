library(sensiPhy)


### Name: clade_continuous
### Title: Influential Clade Detection - Trait Evolution Continuous
###   Characters
### Aliases: clade_continuous

### ** Examples

## Don't show: 
#Load data:
data("primates")
#Model trait evolution accounting for influential clades
clade_cont<-clade_continuous(data=primates$data,phy = primates$phy[[1]],model="BM",
trait.col = "adultMass",clade.col="family",n.sim=1,n.species=20,n.cores = 2,track=TRUE)
## End(Don't show)
## Not run: 
##D data("primates")
##D #Model trait evolution accounting for phylogenetic uncertainty
##D clade_cont<-clade_continuous(data=primates$data,phy = primates$phy[[1]], model="OU",
##D trait.col = "adultMass",clade.col="family",n.sim=30,n.species=10,n.cores = 2,track=TRUE)
##D #Print summary statistics
##D summary(clade_cont)
##D sensi_plot(clade_cont,graph="all")
##D sensi_plot(clade_cont,clade="Cercopithecidae",graph = "sigsq")
##D sensi_plot(clade_cont,clade="Cercopithecidae",graph = "optpar")
##D #Change the evolutionary model, tree transformation or minimum number of species per clade
##D clade_cont2<-clade_continuous(data=primates$data,phy = primates$phy[[1]],model="delta",
##D trait.col = "adultMass",clade.col="family",n.sim=30,n.species=5,n.cores = 2,track=TRUE)
##D summary(clade_cont2)
##D sensi_plot(clade_cont2)
##D clade_cont3<-clade_continuous(data=primates$data,phy = primates$phy[[1]],model="BM",
##D trait.col = "adultMass",clade.col="family",n.sim=30,n.species=5,n.cores = 2,track=TRUE)
##D summary(clade_cont3)
##D sensi_plot(clade_cont3,graph="sigsq")
## End(Not run)



