library(pez)


### Name: comparative.comm
### Title: Creates a community comparative ecology object, the basis of all
###   functions in pez
### Aliases: comparative.comm print.comparative.comm

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
#Do some manual manipulation of your objects (NOTE: $data for traits)
data$data$new.trait <- sample(letters, nrow(data$comm), replace=TRUE)



