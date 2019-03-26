library(taxize)


### Name: plantminer
### Title: Search for taxonomy data from Plantminer.com
### Aliases: plantminer

### ** Examples

## Not run: 
##D # A single taxon
##D plantminer("Ocotea pulchella")
##D 
##D # Many taxa
##D plants <- c("Myrcia lingua", "Myrcia bella", "Ocotea pulchella",
##D 		"Miconia", "Coffea arabica var. amarella", "Bleh")
##D plantminer(plants)
##D 
##D # By deafult, tpl is used, for Theplantlist data,
##D # toggle the from parameter here
##D plantminer("Ocotea pulchella", from = "flora")
## End(Not run)



