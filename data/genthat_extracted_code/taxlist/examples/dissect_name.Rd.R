library(taxlist)


### Name: dissect_name
### Title: Dissect Scientific Names into their Elements
### Aliases: dissect_name
### Keywords: methods

### ** Examples

library(taxlist)
data(Easplist)

Easplist <- subset(Easplist, Level == "variety", slot="relations")
Easplist <- accepted_name(Easplist)[c(1:10),"TaxonName"]

dissect_name(Easplist)



