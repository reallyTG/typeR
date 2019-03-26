library(polmineR)


### Name: get_type
### Title: Get corpus/partition type.
### Aliases: get_type get_type,character-method get_type,Corpus-method
###   get_type,partition-method get_type,partition_bundle-method

### ** Examples

use("polmineR")

get_type("GERMAPARLMINI")

p <- partition("GERMAPARLMINI", date = "2009-10-28")
get_type(p)
is(p)

pb <- partition_bundle("GERMAPARLMINI", s_attribute = "date")
get_type(pb)

gp <- Corpus$new("GERMAPARLMINI") 
get_type(gp)

get_type("REUTERS") # returns NULL - no specialized corpus



