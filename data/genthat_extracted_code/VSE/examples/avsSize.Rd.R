library(VSE)


### Name: avsSize
### Title: avsSize
### Aliases: avsSize
### Keywords: AVS,Granges

### ** Examples

ld<-loadLd(file.path(system.file("extdata", "ld_BCa_raggr.csv", package="VSE")), type="raggr")
avs<-makeAVS(ld)
avsSize(avs)



