library(kst)


### Name: lpath
### Title: Learning Paths in a Knowledge Structure
### Aliases: lpath
### Keywords: math

### ** Examples

kst <- kstructure(set(set(), set("a"), set("b"), set("a","b"), 
   set("a","d"), set("b","c"), set("a","b","c"), set("a","b","d"), 
   set("b","c","d"), set("a","b","c","d"), set("a","b","c","d","e")))
lpath(kst)



