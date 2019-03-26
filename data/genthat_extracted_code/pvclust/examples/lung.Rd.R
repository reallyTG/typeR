library(pvclust)


### Name: lung
### Title: DNA Microarray Data of Lung Tumors
### Aliases: lung
### Keywords: datasets

### ** Examples

## No test: 
## Reading the data
data(lung)

## Multiscale Bootstrap Resampling
lung.pv <- pvclust(lung, nboot=100)

## CAUTION: nboot=100 may be too small for actual use.
##          We suggest nboot=1000 or larger.
##          plot/print functions will be useful for diagnostics.

## Plot the result
plot(lung.pv, cex=0.8, cex.pv=0.7)

ask.bak <- par()$ask
par(ask=TRUE)

pvrect(lung.pv, alpha=0.9)
msplot(lung.pv, edges=c(51,62,68,71))

par(ask=ask.bak)

## Print a cluster with high p-value
lung.pp <- pvpick(lung.pv, alpha=0.9)
lung.pp$clusters[[2]]

## Print its edge number
lung.pp$edges[2]
## End(No test)

## We recommend parallel computing for large dataset as this one
## Not run: 
##D library(snow)
##D cl <- makeCluster(10, type="MPI")
##D lung.pv <- parPvclust(cl, lung, nboot=1000)
## End(Not run)



