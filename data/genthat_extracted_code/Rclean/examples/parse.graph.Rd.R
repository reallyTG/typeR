library(Rclean)


### Name: parse.graph
### Title: .parse.graph - Prases the PROV-JSON formatted output OUTPUT = A
###   symmetric matrix of provenance entity reltionships.
### Aliases: parse.graph

### ** Examples

 data(prov_json)
 prov <- jsonlite::fromJSON(prov_json)
 Rclean:::parse.graph(prov)



