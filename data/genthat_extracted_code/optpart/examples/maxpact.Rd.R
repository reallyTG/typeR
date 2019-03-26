library(optpart)


### Name: maxpact
### Title: Maximally Compact Sets Analysis
### Aliases: maxpact mps.test plot.mps
### Keywords: cluster

### ** Examples

    data(shoshveg)
    dis.bc <- dsvdis(shoshveg,'bray/curtis')
    mps.10 <- maxpact(dis.bc,10)
    data(shoshsite)
    ## Not run: mps.test(mps.10,shoshsite$elevation) 
         # plots graph and produces summary



