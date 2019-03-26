library(optpart)


### Name: mergeclust
### Title: Merge Specified Clusters in a Classification
### Aliases: mergeclust
### Keywords: clustering

### ** Examples

    data(shoshveg)                # returns a vegetation data.frame
    dis.bc <- dsvdis(shoshveg,'bray/curtis')   # returns a Bray/Curtis 
                                               # dissimilarity matrix
    opt.5 <- optpart(5,dis.bc)    # five cluster partition
    opt.5a <- mergeclust(opt.5,5,4)  # reassigns member form cluster 5 to 4



