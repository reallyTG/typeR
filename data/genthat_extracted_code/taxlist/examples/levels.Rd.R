library(taxlist)


### Name: levels
### Title: Set and Retrieves Hierarchical Levels
### Aliases: levels levels,taxlist-method levels<- levels<-,taxlist-method
### Keywords: methods

### ** Examples

library(taxlist)
data(Easplist)
summary(Easplist)

## Get levels of species list
levels(Easplist)

## Add aggregate as new taxonomic level
levels(Easplist) <- c("form","variety","subspecies","species","complex",
	"aggregate","genus","family")
summary(Easplist)



