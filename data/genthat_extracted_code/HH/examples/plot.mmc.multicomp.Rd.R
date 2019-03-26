library(HH)


### Name: plot.mmc.multicomp
### Title: MMC (Mean-mean Multiple Comparisons) plot.
### Aliases: plot.mmc.multicomp
### Keywords: hplot

### ** Examples

data(catalystm)
catalystm1.aov <- aov(concent ~ catalyst, data=catalystm)
summary(catalystm1.aov)

## See ?MMC to see why these contrasts are chosen
catalystm.lmat <- cbind("AB-D" =c( 1, 1, 0,-2),
                        "A-B"  =c( 1,-1, 0, 0),
                        "ABD-C"=c( 1, 1,-3, 1))
dimnames(catalystm.lmat)[[1]] <- levels(catalystm$catalyst)


catalystm.mmc <-
if.R(r={mmc(catalystm1.aov, linfct = mcp(catalyst = "Tukey"),
            focus.lmat=catalystm.lmat)}
    ,s={multicomp.mmc(catalystm1.aov, focus.lmat=catalystm.lmat,
                     plot=FALSE)}
)

## Not run: 
##D ## pairwise contrasts, default settings
##D plot(catalystm.mmc, print.lmat=FALSE)
## End(Not run)

## Centering, scaling, emphasize significant contrasts.
## Needed in R with 7in x 7in default plot window.
## Not needed in S-Plus with 4x3 aspect ratio of plot window.
plot(catalystm.mmc, x.offset=2.1, ry.mmc=c(50,58), print.lmat=FALSE)

## user-specified contrasts
plot(catalystm.mmc, x.offset=2.1, ry.mmc=c(50,58))

## reduce intensity of isomeans grid, number isomeans grid lines
plot(catalystm.mmc, x.offset=2.1, ry.mmc=c(50,58),
     lty.iso=2, col.iso='darkgray', iso.name=FALSE)

## both pairwise contrasts and user-specified contrasts
plot(catalystm.mmc, x.offset=2.1, ry.mmc=c(50,58), lty.iso=2,
     col.iso='darkgray', print.mca=TRUE)

## Not run: 
##D ## newer mmcplot
##D mmcplot(catalystm.mmc)
##D mmcplot(catalystm.mmc, type="lmat")
## End(Not run)



