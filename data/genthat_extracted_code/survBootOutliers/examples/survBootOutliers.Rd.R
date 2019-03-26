library(survBootOutliers)


### Name: survBootOutliers
### Title: Extract the most outlying observations following a criteria
###   based on the bootstrapped concordance with parallel processing
### Aliases: survBootOutliers

### ** Examples

## One Step Deletion "osd" method
## Not run: 
##D whas <- get.whas100.dataset()
##D print( getwd() )
##D outliers_osd <- survBootOutliers( 
##D    surv.object=Surv(time = whas$times,event = whas$status ), 
##D    covariate.data = whas[,2:5], 
##D    sod.method = "osd", 
##D    max.outliers = 5
##D  )
## End(Not run)

## Bootstrap Hypothesis Test "bht" with 1000 bootstrap samples, 
## each with 100 individuals, running without parallelism.
## Not run: 
##D   
##D whas <- get.whas100.dataset()
##D outliers_bht <- survBootOutliers( 
##D      surv.object=Surv(time = whas$times,event = whas$status ), 
##D      covariate.data = whas[,2:5], 
##D      sod.method = "bht", 
##D      B = 1000, 
##D      B.N = 100,
##D      parallel.param = BiocParallel::MulticoreParam() 
##D )
## End(Not run)

## Dual Bootstrap Hypothesis Test "dbht" with 1000 bootstrap samples,
## each with 50 individuals and running on all available cores.
## Not run: 
##D  whas <- get.whas100.dataset()
##D outliers_dbht <- survBootOutliers( 
##D    surv.object=Surv(time = whas$times,event = whas$status ), 
##D    covariate.data = whas[,2:5], 
##D    sod.method = "dbht",
##D    B = 1000, 
##D    B.N = 50,
##D    parallel.param = BiocParallel::MulticoreParam() 
##D )
## End(Not run)
## One Step Deletion "osd" with an amount of 10 for maximum outlier count
whas <- get.whas100.dataset()
outliers_osd <- survBootOutliers( 
   surv.object=Surv(time = whas$times,event = whas$status ), 
   covariate.data = whas[,2:5], 
   sod.method = "osd", 
   max.outliers = 10
)

## Likelihood displacement criterion for outlier ranking
whas <- get.whas100.dataset()
outliers_ld <- survBootOutliers( 
   surv.object=Surv(time = whas$times,event = whas$status ), 
   covariate.data = whas[,2:5], 
   sod.method = "ld"
)

## Cox regression deviance residuals criterion for outlier ranking
whas <- get.whas100.dataset()
outliers_deviance <- survBootOutliers( 
   surv.object=Surv(time = whas$times,event = whas$status ), 
   covariate.data = whas[,2:5], 
   sod.method = "deviance"
)

## Cox regression Martingale residuals criterion for outlier ranking
whas <- get.whas100.dataset()
outliers_martingale <- survBootOutliers( 
   surv.object=Surv(time = whas$times,event = whas$status ), 
   covariate.data = whas[,2:5], 
   sod.method = "martingale"
)




