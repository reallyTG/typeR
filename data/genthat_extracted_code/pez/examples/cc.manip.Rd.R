library(pez)


### Name: cc.manip
### Title: Manipulating and examining comparative.comm objects
### Aliases: [.comparative.comm as.data.frame.comparative.comm
###   assemblage.phylogenies cc.manip comm comm<- env env.names env<- phy
###   phy<- sites sites<- species species<- trait.names traits traits<-
###   tree tree<- within.comparative.comm

### ** Examples

data(laja)
data <- comparative.comm(invert.tree, river.sites, invert.traits, river.env)
#Subset on species, then sites
data <- data[1:5,]
data <- data[,1:5]
#Site and species can be manipulated
species(data)
sites(data)[1:3] <- c("lovely", "invert", "sites")
#Other data can be viewed
trait.names(data)
env.names(data)
#Get assemblage phylogenies of all sites
assemblage.phylogenies(data)
#Add some trait/env data in
traits(data)$new.trait <- sample(letters, nrow(comm(data)), replace=TRUE)
env(data)$new.env <- sample(letters, ncol(comm(data)), replace=TRUE)
#Manipulate/check phylogeny and community matrix
phy(data) #...tree(data) works too...
comm(data)[1,3] <- 3
comm(data) <- comm(data)[-3,]



