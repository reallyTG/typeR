library(optpart)


### Name: optsil
### Title: Clustering by Optimizing Silhouette Widths
### Aliases: optsil optsil.default optsil.clustering optsil.partana
###   optsil.partition optsil.stride
### Keywords: cluster

### ** Examples

    data(shoshveg)
    dis.bc <- dsvdis(shoshveg,'bray/curtis')
    opt.5 <- optpart(5,dis.bc)
    sil.5 <- optsil(opt.5,dis.bc,100) # make take a few minutes
    summary(silhouette(sil.5,dis.bc))
    ## Not run: plot(silhouette(sil.5,dis.bc))



