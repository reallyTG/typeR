library(IBDhaploRtools)


### Name: ibdhap.compare.loci
### Title: ibdhap compare.loci
### Aliases: ibdhap.compare.loci

### ** Examples


## this example is taken from the package vignette.
##See vignette(IBDhaploRtools_tutorial)

data(qibd_phased)
data(ids_phased)
data(trueibd_phased)

phased.gold <- ibdhap.make.calls( qibd.file  = qibd_phased,
                   ids.file= ids_phased, cutoff = 0.8)

ibdhap.compare.loci(phased.gold, trueibd_phased, "h")



