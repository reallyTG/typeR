library(Rclean)


### Name: get.spine
### Title: .get.spine - Find the minimal path through the provenance
###   necessary to produce a result.
### Aliases: get.spine

### ** Examples

data(prov_json)
prov <- read.prov(prov_json)
Rclean:::get.spine("d1", prov$graph)



