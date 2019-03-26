library(kst)


### Name: as.relation
### Title: Surmise Relations of Knowledge Structures
### Aliases: as.relation.kstructure as.relation.kbase as.relation.kfamset
### Keywords: math

### ** Examples

kst <- kstructure(set(set("a"), set("a","b"), set("a","c"), set("d","e"), 
   set("a","b","d","e"), set("a","c","d","e"), set("a","b","c","d","e")))
as.relation(kst)



