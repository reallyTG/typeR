library(taxlist)


### Name: accepted_name
### Title: Manage Accepted Names, Synonyms and Basionyms
### Aliases: accepted_name accepted_name,taxlist,numeric-method
###   accepted_name,taxlist,missing-method accepted_name<-
###   accepted_name<-,taxlist,numeric,numeric-method synonyms
###   synonyms,taxlist,numeric-method synonyms,taxlist,missing-method
###   basionym basionym,taxlist,numeric-method
###   basionym,taxlist,missing-method basionym<-
###   basionym<-,taxlist,numeric,numeric-method
### Keywords: methods

### ** Examples

library(taxlist)
data(Easplist)

## Set a different accepted name for Cyclosorus interruptus
summary(Easplist, "Cyclosorus interruptus")
accepted_name(Easplist, 50074) <- 53097
summary(Easplist, 50074)

## Inserting a new name first
summary(Easplist, "Basella alba")
Easplist <- add_synonym(Easplist, 68, TaxonName="Basella cordifolia",
	AuthorName="Lam.")
summary(Easplist, 68)
accepted_name(Easplist, 68) <- 56139
summary(Easplist, 68)

## No test: 
## attempt to use a name from another concept
accepted_name(Easplist, 50074) <- 51129
## End(No test)



