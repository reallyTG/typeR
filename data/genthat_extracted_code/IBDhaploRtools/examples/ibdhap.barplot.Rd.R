library(IBDhaploRtools)


### Name: ibdhap.barplot
### Title: create ibd barplot
### Aliases: ibdhap.barplot

### ** Examples


## this example is taken from the package vignette.
##See vignette(IBDhaploRtools_tutorial)

data(qibd_phased)
data(ids_phased)

phased.gold <- ibdhap.make.calls( qibd.file  = qibd_phased,
                   ids.file= ids_phased, cutoff = 0.8)

par(mfrow=c(4,1)) 
ibdhap.barplot(phased.gold[,1], data.type="h", xlab="", ylab="") 
ibdhap.barplot(phased.gold[,2], data.type="h", xlab="", ylab="")
ibdhap.barplot(phased.gold[,3], data.type="h", xlab="", ylab="")
ibdhap.barplot(phased.gold[,4], data.type="h", xlab="", ylab="")



