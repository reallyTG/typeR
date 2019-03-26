library(forestmangr)


### Name: species_diversity
### Title: Get the species diversity indexes
### Aliases: species_diversity

### ** Examples

library(forestmangr)
data("exfm20")
exfm20

# By default, the function returns all indexes:
species_diversity(exfm20, "scientific.name")

# It's possible to use a subdivision variable, like plot, to get
# the indexes for each subdivision:
species_diversity(exfm20, "scientific.name", "transect") 

# To only get one specific index, use the index argument:
species_diversity(exfm20, "scientific.name", index = "H")
species_diversity(exfm20, "scientific.name", index = "S")
species_diversity(exfm20, "scientific.name", index = "Hmax")
species_diversity(exfm20, "scientific.name", index = "J")





