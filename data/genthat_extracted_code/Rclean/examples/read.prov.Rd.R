library(Rclean)


### Name: read.prov
### Title: read.prov - Read and parse provenance from a JSON file. OUTPUT =
###   Returns a dataframe containing the provenance.
### Aliases: read.prov

### ** Examples

 data(prov_json)
 prov <- read.prov(prov_json)
 prov$graph
 prov$info$activity
 prov$info$environment
 prov$info$entity



