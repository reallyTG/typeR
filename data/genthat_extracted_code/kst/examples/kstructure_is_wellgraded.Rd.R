library(kst)


### Name: kstructure_is_wellgraded
### Title: Well-Gradedness of Knowledge Structures
### Aliases: kstructure_is_wellgraded
### Keywords: math

### ** Examples

kst <- kstructure(set(set(), set("a"), set("b"), set("c"), set("a","b"), 
   set("b","c"), set("a","b","c")))
kstructure_is_wellgraded(kst)

kst <- kstructure(set(set(), set("a"), set("b"), set("c"), set("a","b"), 
   set("a","b","c")))
kstructure_is_wellgraded(kst)



