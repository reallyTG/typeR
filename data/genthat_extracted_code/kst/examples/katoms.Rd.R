library(kst)


### Name: katoms
### Title: Atoms of Knowledge Structures
### Aliases: katoms
### Keywords: math

### ** Examples

kst <- kstructure(set(set("a"), set("a","b"), set("a","c"), set("d","e"), 
   set("a","b","d","e"), set("a","c","d","e"), set("a","b","c","d","e")))
katoms(kst, items=set("a","b","c"))



