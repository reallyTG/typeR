library(optpart)


### Name: consider
### Title: Recommendations for Possible Merging of Clusters
### Aliases: consider
### Keywords: clustering

### ** Examples

    data(shoshveg)         # returns a vegetation data.frame
    dis.bc <- dsvdis(shoshveg,'bray') # calculates a Bray/Curtis
                                      # dissimilarity matrix
    opt.5 <- optpart(5,dis.bc)        # generates a 5 cluster partition
    consider(opt.5)       # recommends possible clusters to merge



