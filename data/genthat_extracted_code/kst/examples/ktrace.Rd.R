library(kst)


### Name: ktrace
### Title: Trace of Knowledge Structures
### Aliases: ktrace
### Keywords: math

### ** Examples

kst <- kstructure(set(set("a"), set("a","b"), set("a","c"), set("d","e"), 
   set("a","b","d","e"), set("a","c","d","e"), set("a","b","c","d","e")))
ktrace(kst, items=set("c","d","e"))



