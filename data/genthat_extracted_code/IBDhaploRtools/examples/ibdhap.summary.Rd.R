library(IBDhaploRtools)


### Name: ibdhap.summary.calls
### Title: ibdhap summary of called states
### Aliases: ibdhap.summary.calls

### ** Examples


## this example is taken from the package vignette.
##See vignette(IBDhaploRtools_tutorial)

data(qibd_phased)
data(ids_phased)
data(trueibd_phased)

phased.gold <- ibdhap.make.calls( qibd.file  = qibd_phased,
                   ids.file= ids_phased, cutoff = 0.8)

summary.phased <- ibdhap.summary.calls( phased.gold, data.type="h")



