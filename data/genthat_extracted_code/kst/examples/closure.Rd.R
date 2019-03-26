library(kst)


### Name: closure
### Title: Closure of a Knowledge Structure
### Aliases: closure.kstructure closure.kbase closure.kfamset
### Keywords: math

### ** Examples

kst <- kstructure(set(set("a"), set("a","b"), set("a","c"), set("d","e"), 
   set("a","b","d","e"), set("a","c","d","e"), set("a","b","c","d","e")))
closure(kst, operation="union")



