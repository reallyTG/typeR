library(sensiPhy)


### Name: tree_discrete
### Title: Phylogenetic uncertainty - Trait Evolution Discrete Characters
### Aliases: tree_discrete

### ** Examples

## Not run: 
##D #Load data:
##D data("primates")
##D #Create a binary trait factor 
##D adultMass_binary<-ifelse(primates$data$adultMass > 7350, "big", "small")
##D adultMass_binary<-as.factor(as.factor(adultMass_binary))
##D names(adultMass_binary)<-rownames(primates$data)
##D #Model trait evolution accounting for phylogenetic uncertainty
##D tree_binary<-tree_discrete(data = adultMass_binary,phy = primates$phy,
##D model = "ARD",transform = "none",n.tree = 30,n.cores = 2,track = TRUE)
##D #Print summary statistics
##D summary(tree_binary)
##D sensi_plot(tree_binary)
##D sensi_plot(tree_binary,graphs="q12")
##D sensi_plot(tree_binary,graphs="q21")
##D #Use a different evolutionary model or transformation.
##D tree_binary_lambda<-tree_discrete(data = adultMass_binary,phy = primates$phy,
##D model = "SYM",transform = "lambda",n.tree = 30,n.cores = 2,track = TRUE)
##D summary(tree_binary_lambda) #Using Pagel's Lambda
##D sensi_plot(tree_binary_lambda)  
##D #Symmetrical rates, with an Early Burst (EB) model of trait evolution
##D tree_binary_SYM_EB<-tree_discrete(data = adultMass_binary,phy = primates$phy,
##D model = "SYM",transform = "EB",n.tree = 30,n.cores = 2,track = TRUE)
##D summary(tree_binary_SYM_EB)
##D sensi_plot(tree_binary_SYM_EB) 
##D sensi_plot(tree_binary_SYM_EB,graphs="optpar") 
## End(Not run)



