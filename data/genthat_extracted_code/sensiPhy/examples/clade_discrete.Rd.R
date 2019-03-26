library(sensiPhy)


### Name: clade_discrete
### Title: Influential Clade Detection - Trait Evolution Discrete
###   Characters
### Aliases: clade_discrete

### ** Examples

## Not run: 
##D #Load data:
##D data("primates")
##D #Create a binary trait factor 
##D primates$data$adultMass_binary<-ifelse(primates$data$adultMass > 7350, "big", "small")
##D clade_disc<-clade_discrete(data=primates$data,phy = primates$phy[[1]],model="SYM",
##D trait.col = "adultMass_binary",clade.col="family",n.sim=30,n.species=10,n.cores = 2)
##D summary(clade_disc)
##D sensi_plot(clade_disc)
##D sensi_plot(clade_disc, clade = "Cebidae", graph = "q12")
##D #Change the evolutionary model, tree transformation or minimum number of species per clade
##D clade_disc_2<-clade_discrete(data=primates$data,phy = primates$phy[[1]],
##D model="ARD",transform="kappa",
##D trait.col = "adultMass_binary",clade.col="family",n.sim=30,
##D n.species=8,n.cores = 2)
##D summary(clade_disc_2)
##D sensi_plot(clade_disc_2)
##D sensi_plot(clade_disc_2, graph = "q12")
##D sensi_plot(clade_disc_2, graph = "q21")
## End(Not run)



