library(divDyn)


### Name: indices
### Title: Scalar indices of diversity
### Aliases: indices

### ** Examples

# the coral data
  data(corals)

# Pleistocene subset
  plei <- corals[corals$stg==94,]

# calculate everything
  pleiIndex<-indices(plei$genus, plei$coll)





