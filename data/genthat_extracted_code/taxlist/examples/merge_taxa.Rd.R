library(taxlist)


### Name: merge_taxa
### Title: Merge Concepts
### Aliases: merge_taxa merge_taxa,taxlist,numeric,missing-method
###   merge_taxa,taxlist,missing,character-method change_cocept
###   change_concept<- change_concept<-,taxlist-method
### Keywords: methods

### ** Examples

library(taxlist)
data(Easplist)

## Merge Cyperus papyrus and Cyperus dives
summary(Easplist, c(206, 197))

Easplist <- merge_taxa(Easplist, c(206, 197), print_output=TRUE)

## Move the name Typha aethiopica to concept 573 (T. latifolia)
change_concept(Easplist, 53130) <- 573
summary(Easplist, c(50105,573))
## No test: 
## Attempting to move an accepted name
change_concept(Easplist, 50105) <- 573
## End(No test)



