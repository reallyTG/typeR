library(kst)


### Name: kdomain
### Title: Domain of Knowledge Structures or Bases
### Aliases: kdomain
### Keywords: math

### ** Examples

kst <- kstructure(set(set("a"), set("a","b"), set("a","c"), set("d","e"), 
   set("a","b","d","e"), set("a","c","d","e"), set("a","b","c","d","e")))
kdomain(kst)



