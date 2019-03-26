library(SemiPar)


### Name: ustemp
### Title: U.S. temperature data
### Aliases: ustemp
### Keywords: datasets

### ** Examples

library(SemiPar)
data(ustemp)
attach(ustemp)
grey.levs <- min.temp+20
col.vec <- paste("grey",as.character(grey.levs),sep="")
plot(-longitude,latitude,col=col.vec,pch=16,cex=3,xlim=c(-130,-60))
text(-longitude,latitude,as.character(city))



