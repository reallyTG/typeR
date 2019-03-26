library(scape)


### Name: plotIndex
### Title: Plot Abundance Index
### Aliases: plotIndex

### ** Examples

plotIndex(x.cod, xlab="Year", ylab="Survey abundance index",
          strip=FALSE)

plotIndex(x.oreo, "c", series="Series 1-1", xlim=c(1981,1990))

plotIndex(x.oreo, "c", xlim=list(c(1981,1990),c(1992,2002)),
          xlab="Year", ylab="Observed CPUE",
          col.points=c("salmon","seagreen"), lty.lines=0)



