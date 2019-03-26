library(divDyn)


### Name: georange
### Title: Estimation of geographic ranges from occurrence data
### Aliases: georange

### ** Examples

data(corals)
# select a  taxon from a certain time slice
  bitax <- corals[corals$stg==69 & corals$genus=="Microsolena",]
  georange(bitax, lng="paleolng", lat="paleolat", method="co")




