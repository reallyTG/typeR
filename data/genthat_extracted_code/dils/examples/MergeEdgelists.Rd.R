library(dils)


### Name: MergeEdgelists
### Title: Combine edgelists into a single data.frame
### Aliases: MergeEdgelists

### ** Examples

edgelist1 <- data.frame(expand.grid(letters[1:2], letters[1:2]),
                        uniform=runif(4))
edgelist2 <- data.frame(v1=c("a", "a"), v2=c("a", "b"), manual=c(.3, .5))
MergeEdgelists(edgelist1, edgelist2)



