library(optpart)


### Name: murdoch
### Title: Indicator Species Analysis by Murdoch Preference Function
### Aliases: murdoch summary.murdoch plot.murdoch
### Keywords: cluster

### ** Examples

    data(shoshveg) # returns a vegetation dataframe
    dis.bc <- dsvdis(shoshveg,'bray/curtis') # returns a dissimilarity matrix
    clust <- optpart(5,dis.bc)
    murdoch(shoshveg,clust$clustering==1)



