library(VLMC)


### Name: as.dendrogram.vlmc
### Title: Dendrogram Construction from VLMCs
### Aliases: as.dendrogram.vlmc
### Keywords: graphs iplot

### ** Examples

data(presidents)
dpr <- factor(cut(presidents, c(0,45,70,100)), exclude=NULL)# NA = 4th level
(vlmc.pres <- vlmc(dpr))
draw(vlmc.pres)
(dv.dpr <- as.dendrogram(vlmc.pres))
str(dv.dpr)
str(unclass(dv.dpr))

plot(dv.dpr, type ="tr", nodePar = list(pch=c(1,16), cex = 1.5))

## Artificial example
f1 <- c(1,0,0,0) ; f2 <- rep(1:0, 2)
(dt1 <- c(f1,f1,f2,f1,f2,f2,f1))
(vlmc.dt1c01 <- vlmc(dts = dt1, cutoff.prune = 0.1))
(dvlmc <- as.dendrogram(vlmc.dt1c01))
str(dvlmc)
## not so useful:
plot(dvlmc, nodePar= list(pch=c(1,16)))
## complete disaster:
plot(dvlmc, type ="tr", nodePar= list(pch=c(1,16)))

## but this is not (yet) so much better (want the same angles to left
## and right!!
plot(dvlmc, type ="tr", nodePar = list(pch=c(1,16)), center=TRUE,
     main = format(vlmc.dt1c01$call))
mtext(paste("dt1 =", gsub(" ","",deparse(dt1,width=100))))



