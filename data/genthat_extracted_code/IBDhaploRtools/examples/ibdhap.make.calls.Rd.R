library(IBDhaploRtools)


### Name: ibdhap.make.calls
### Title: ibdhap.make.calls
### Aliases: ibdhap.make.calls

### ** Examples


## this example is taken from the package vignette.
##See vignette(IBDhaploRtools_tutorial)

data(qibd_phased)
data(ids_phased)

phased.gold <- ibdhap.make.calls( qibd.file  = qibd_phased,
                   ids.file= ids_phased, cutoff = 0.8)

## alternatively, specify the file location, e.g.
## qibd.filename <- '~/Documents/qibd_unphased_2011.gold'
## ids.filename <- '~/Documents/ids_unphased_2011.gold'
## phased.gold <- ibdhap.make.calls( qibd.filename = qibd.filename, 
##                   ids.filename = ids.filename, cutoff = 0.8)




