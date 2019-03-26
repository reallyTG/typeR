library(IBDhaploRtools)


### Name: ibdhap.transitions
### Title: create transition matrix
### Aliases: ibdhap.transitions

### ** Examples

## this example is taken from the package vignette.
##See vignette(IBDhaploRtools_tutorial)

data(qibd_phased)
data(ids_phased)
data(trueibd_phased)

phased.gold <- ibdhap.make.calls( qibd.file  = qibd_phased,
                   ids.file= ids_phased, cutoff = 0.8)
transitions.phased <- ibdhap.transitions(phased.gold, data.type="h")



