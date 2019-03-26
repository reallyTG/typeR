library(crunch)


### Name: combine
### Title: Combine categories or responses
### Aliases: combine

### ** Examples

## Not run: 
##D ds$fav_pet2 <- combine(ds$fav_pet, name="Pets (combined)",
##D     combinations=list(list(name="Mammals", categories=c("Cat", "Dog")),
##D                       list(name="Reptiles", categories=c("Snake", "Lizard"))))
##D ds$pets_owned2 <- combine(ds$allpets, name="Pets owned (collapsed)",
##D     combinations=list(list(name="Mammals", responses=c("Cat", "Dog"))))
## End(Not run)



