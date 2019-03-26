library(kst)


### Name: plot
### Title: Plot Family of Sets
### Aliases: plot.kstructure plot.kbase plot.kfamset
### Keywords: math

### ** Examples

fs <- kfamset(set(set("a"), set("a","b"), set("a","c"), set("d","e"), 
   set("a","b","d","e"), set("a","c","d","e"), set("a","b","c","d","e")))
if(require("Rgraphviz")) {plot(fs)}



