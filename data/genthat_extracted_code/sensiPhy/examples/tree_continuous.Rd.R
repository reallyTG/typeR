library(sensiPhy)


### Name: tree_continuous
### Title: Phylogenetic uncertainty - Trait Evolution Continuous Characters
### Aliases: tree_continuous

### ** Examples

## Don't show: 
#Load data:
data("primates")
#Model trait evolution accounting for phylogenetic uncertainty
adultMass<-primates$data$adultMass
names(adultMass)<-rownames(primates$data)
tree_cont<-tree_continuous(data = adultMass,phy = primates$phy,
model = "OU",n.tree=1,n.cores = 2,track = TRUE)
## End(Don't show)
## Not run: 
##D #Load data:
##D data("primates")
##D #Model trait evolution accounting for phylogenetic uncertainty
##D adultMass<-primates$data$adultMass
##D names(adultMass)<-rownames(primates$data)
##D tree_cont<-tree_continuous(data = adultMass,phy = primates$phy,
##D model = "OU",n.tree=30,n.cores = 2,track = TRUE)
##D #Print summary statistics
##D summary(tree_cont)
##D sensi_plot(tree_cont)
##D sensi_plot(tree_cont,graphs="sigsq")
##D sensi_plot(tree_cont,graphs="optpar")
##D #Use a different evolutionary model 
##D tree_cont2<-tree_continuous(data = adultMass,phy = primates$phy,
##D model = "delta",n.tree=30,n.cores = 2,track = TRUE)
##D summary(tree_cont2)
##D sensi_plot(tree_cont2)
## End(Not run)



