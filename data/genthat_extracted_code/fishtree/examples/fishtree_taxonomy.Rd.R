library(fishtree)


### Name: fishtree_taxonomy
### Title: Get taxonomies and other data from the Fish Tree of Life
### Aliases: fishtree_taxonomy

### ** Examples

test <- fishtree_taxonomy(family = "Labridae")
paste("There are ", length(test$sampled_species), "sampled species out of",
      length(test$species), "in wrasses.")



