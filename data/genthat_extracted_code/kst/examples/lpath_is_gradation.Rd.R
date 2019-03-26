library(kst)


### Name: lpath_is_gradation
### Title: Gradation Property of Learning Paths
### Aliases: lpath_is_gradation
### Keywords: math

### ** Examples

kst <- kstructure(set(set(), set("c"), set("a","b"), set("b","c"), 
   set("c","d"), set("d","e"), set("a","b","c"), set("b","c","d"), 
   set("c","d","e"), set("a","b","c","d"), set("a","b","d","e"), 
   set("b","c","d","e"), set("a","b","c","d","e")))
lp <- lpath(kst)
lpath_is_gradation(lp)



