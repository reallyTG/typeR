library(insect)


### Name: purge
### Title: Identify and remove erroneous reference sequences.
### Aliases: purge

### ** Examples

  data(whales)
  data(whale_taxonomy)
  whales <- purge(whales, db = whale_taxonomy, level = "species",
                  threshold = 0.97, method = "farthest")



