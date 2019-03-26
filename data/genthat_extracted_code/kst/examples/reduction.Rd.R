library(kst)


### Name: reduction
### Title: Reduction of Knowledge Structures
### Aliases: reduction.kstructure reduction.kfamset
### Keywords: math

### ** Examples

kst <- kstructure(set(set("a"), set("a","b"), set("a","c"), set("d","e"), 
   set("a","b","d","e"), set("a","c","d","e"), set("a","b","c","d","e")))
reduction(kst, operation="discrimination")



