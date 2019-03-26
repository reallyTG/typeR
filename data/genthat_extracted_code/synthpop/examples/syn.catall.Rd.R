library(synthpop)


### Name: syn.catall
### Title: Synthesis of a group of categorical variables from a saturated
###   model
### Aliases: syn.catall
### Keywords: datagen

### ** Examples

ods <- SD2011[, c(1, 4, 5, 6, 2, 10, 11)]
table(ods[, c("placesize", "region")])

# Each \code{placesize_region} sublist: 
# for each relevant level of \code{placesize} defined in the first element, 
# the second element defines regions (variable \code{region}) that do not 
# have places of that size.

struct.zero <- list(
  placesize_region = list("URBAN 500,000 AND OVER", c(2, 4, 5, 8:13, 16)),
  placesize_region = list("URBAN 200,000-500,000", c(3, 4, 10:11, 13)),
  placesize_region = list("URBAN 20,000-100,000", c(1, 3, 5, 6, 8, 9, 14:15)))

syncatall <- syn(ods, method = c(rep("catall", 4), "ctree", "normrank", "ctree"),
                 catall.priorn = 2, catall.structzero = struct.zero)



