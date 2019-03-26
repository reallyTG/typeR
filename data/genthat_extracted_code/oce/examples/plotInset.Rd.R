library(oce)


### Name: plotInset
### Title: Plot an Inset Diagram
### Aliases: plotInset

### ** Examples


library(oce)
## power law in linear and log form
x <- 1:10
y <- x^2
plot(x, y, log='xy',type='l')
plotInset(3, 1, 10, 8,
          expr=plot(x,y,type='l',cex.axis=3/4,mgp=c(3/2, 1/2, 0)),
          mar=c(2.5, 2.5, 1, 1))

## CTD data with location
data(ctd)
plot(ctd, which="TS")
plotInset(29.9, 2.7, 31, 10,
          expr=plot(ctd, which='map',
          coastline="coastlineWorld",
          span=5000, mar=NULL, cex.axis=3/4))



