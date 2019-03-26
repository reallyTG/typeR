library(oce)


### Name: plot,argo-method
### Title: Plot Argo Data
### Aliases: plot,argo-method plot.argo

### ** Examples

library(oce)
data(argo)
tc <- cut(argo[["time"]], "year")
plot(argo, pch=as.integer(tc))
year <- substr(levels(tc), 1, 4)
data(topoWorld)
contour(topoWorld[['longitude']], topoWorld[['latitude']],
        topoWorld[['z']], add=TRUE)
legend("bottomleft", pch=seq_along(year), legend=year, bg="white", cex=3/4)




