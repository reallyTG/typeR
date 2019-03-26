library(lulcc)


### Name: allowNeighb
### Title: Implement neighbourhood decision rules
### Aliases: allowNeighb

### ** Examples


## Plum Island Ecosystems

## load observed land use data
obs <- ObsLulcRasterStack(x=pie,
                     pattern="lu",
                     categories=c(1,2,3),
                     labels=c("forest","built","other"),
                     t=c(0,6,14))

## create a NeighbRasterStack object for forest only
w <- matrix(data=1, nrow=3, ncol=3)
nb <- NeighbRasterStack(x=obs[[1]], weights=w, categories=1)

## only allow change to forest within neighbourhood of current forest cells
## note that rules can be any value between zero (less restrictive) and one
## (more restrictive)
nb.allow <- allowNeighb(neighb=nb,
                        x=obs[[1]],
                        categories=obs@categories,
                        rules=0.5)

## create raster showing cells allowed to change to forest
r <- obs[[1]]
r[!is.na(r)] <- nb.allow[,1]
plot(r)

## NB output is only useful when used within an allocation routine




