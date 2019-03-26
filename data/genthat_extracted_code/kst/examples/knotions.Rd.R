library(kst)


### Name: knotions
### Title: Notions of Knowledge Structures or Bases
### Aliases: knotions
### Keywords: math

### ** Examples

kst <- kstructure(set(set("a"), set("a","b"), set("a","c"), set("d","e"), 
   set("a","b","d","e"), set("a","c","d","e"), set("a","b","c","d","e")))
knotions(kst)



