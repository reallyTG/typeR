library(clues)


### Name: get_Silhouette
### Title: Compute Silhouette Index
### Aliases: get_Silhouette
### Keywords: cluster

### ** Examples

    data(Maronna)
    # data matrix
    maronna <- Maronna$maronna

    # cluster membership
    maronna.mem <- Maronna$maronna.mem
     
    tt <- get_Silhouette(maronna, maronna.mem)
    tt$avg.s



