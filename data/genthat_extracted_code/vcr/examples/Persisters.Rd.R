library(vcr)


### Name: Persisters
### Title: Keeps track of the cassette persisters in a hash-like object
### Aliases: Persisters persister_fetch
### Keywords: internal

### ** Examples

(aa <- Persisters$new())
aa$name
aa$persisters
yaml_serializer <- aa$persisters$new()
yaml_serializer



