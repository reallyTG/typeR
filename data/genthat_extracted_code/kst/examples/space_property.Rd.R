library(kst)


### Name: space_property
### Title: Space Property of a Knowledge Structure
### Aliases: kstructure_is_kspace kspace
### Keywords: math

### ** Examples

kst <- kstructure(set(set("a"), set("a","b"), set("a","c"), set("d","e"), 
   set("a","b","d","e"), set("a","c","d","e"), set("a","b","c","d","e")))

# test for knowledge space
kstructure_is_kspace(kst)

# convert to knowledge space
kspace(kst)



