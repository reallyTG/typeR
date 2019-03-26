library(kst)


### Name: kfringe
### Title: Fringes of Knowledge States
### Aliases: kfringe kfringe_inner kfringe_outer
### Keywords: math

### ** Examples

kst <- kstructure(set(set(), set("c"), set("a","b"), set("b","c"), 
   set("c","d"), set("d","e"), set("a","b","c"), set("b","c","d"), 
   set("c","d","e"), set("a","b","c","d"), set("a","b","d","e"), 
   set("b","c","d","e"), set("a","b","c","d","e")))

# fringe
kfringe(kst, set("c","d","e"))



