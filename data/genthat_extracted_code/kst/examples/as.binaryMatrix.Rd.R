library(kst)


### Name: as.binaryMatrix
### Title: Matrix Representation of Knowledge Structures
### Aliases: as.binaryMatrix
### Keywords: math

### ** Examples

kst <- kstructure(set(set("a"), set("a","b"), set("a","c"), set("d","e"), 
   set("a","b","d","e"), set("a","c","d","e"), set("a","b","c","d","e")))
as.binaryMatrix(kst)



