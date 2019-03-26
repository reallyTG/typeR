library(Rclean)


### Name: parse.info
### Title: .parse.info - Parse node information from PROV-JSON. OUTPUT = A
###   matrix of node information.
### Aliases: parse.info

### ** Examples

 data(prov_json)
 prov <- jsonlite::fromJSON(prov_json)
 Rclean:::parse.info(prov)



