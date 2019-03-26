library(funcy)


### Name: plot-methods
### Title: Methods for Function 'plot' in Package 'funcy'
### Aliases: plot,funcyOutList,missing-method plot,funcyOut,missing-method
###   plot,funcyOut,ANY-method plot,funcyOutMbc-fitfclust,missing-method
###   plot,funcyOutMbc-fscm,missing-method
### Keywords: plot

### ** Examples

set.seed(2804)
ds <- sampleFuncy(obsNr=60, k=4, timeNrMin=5, timeNrMax=10, reg=FALSE)
data <- Data(ds)
clusters <- Cluster(ds)
res <- funcit(data=data, clusters=clusters,
              methods=c("fitfclust","distclust", "iterSubspace") ,
              k=4, parallel=TRUE)
plot(res)
plot(res, select="fitfclust", type="conf")
plot(res, select="fitfclust", type="discrim")
plot(res, select="distclust", type="shadow")



