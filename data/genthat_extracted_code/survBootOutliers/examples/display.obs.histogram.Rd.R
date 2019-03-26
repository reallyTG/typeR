library(survBootOutliers)


### Name: display.obs.histogram
### Title: Auxiliar function that displays the concordance histogram
###   associated with the observation.
### Aliases: display.obs.histogram

### ** Examples

## Not run: 
##D whas <- get.whas100.dataset()
##D outliers_bht <- survBootOutliers( 
##D       surv.object=Surv(time = whas$times,event = whas$status ), 
##D      covariate.data = whas[,2:5], 
##D      sod.method = "bht", 
##D      B = 2000, B.N = 100 , 
##D      parallel.param = BiocParallel::MulticoreParam() 
##D )
##D display.obs.histogram(outliers_bht$histograms, "bht", 67)
## End(Not run)




