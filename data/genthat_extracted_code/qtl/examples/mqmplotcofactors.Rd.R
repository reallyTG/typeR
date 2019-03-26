library(qtl)


### Name: mqmplot.cofactors
### Title: Plot cofactors on the genetic map
### Aliases: mqmplot.cofactors
### Keywords: hplot

### ** Examples

data(multitrait)
cof1 <- mqmsetcofactors(multitrait,20)
cof2 <- mqmsetcofactors(multitrait,10)
op <- par(mfrow=c(2,1))
mqmplot.cofactors(multitrait,cof1,col="blue")
mqmplot.cofactors(multitrait,cof2,col="blue")
op <- par(mfrow=c(1,1))



