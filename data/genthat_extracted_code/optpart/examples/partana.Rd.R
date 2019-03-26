library(optpart)


### Name: partana
### Title: Partition Analysis
### Aliases: partana partana.default partana.partition partana.clustering
###   partana.stride summary.partana plot.partana
### Keywords: cluster

### ** Examples

    data(shoshveg)
    data(shoshsite)
    dis.bc <- dsvdis(shoshveg,'bray/curtis')
    demo.part <- partana(cut(shoshsite$elev,5),dis.bc)
    summary(demo.part)



