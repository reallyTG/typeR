library(kst)


### Name: kbase
### Title: base of a Knowledge Space
### Aliases: kbase
### Keywords: math

### ** Examples

kst <- kspace(kstructure(set(set("a"), set("a","b"), set("a","c"), set("d","e"), 
   set("a","b","d","e"), set("a","c","d","e"), set("a","b","c","d","e"))))
kbase(kst)



