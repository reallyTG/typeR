library(prodest)


### Name: prodestLP
### Title: Estimate productivity - Levinsohn-Petrin method
### Aliases: prodestLP

### ** Examples


    require(prodest)

    ## Chilean data on production.
    ## Publicly available at http://www.ine.cl/canales/chile_estadistico/estadisticas_
    ## economicas/industria/series_estadisticas/series_estadisticas_enia.php

    data(chilean)

    # we fit a model with two free (skilled and unskilled), one state (capital)
    # and one proxy variable (electricity)

    set.seed(154673)
    LP.fit <- prodestLP(chilean$Y, fX = cbind(chilean$fX1, chilean$fX2), chilean$sX,
                        chilean$pX, chilean$idvar, chilean$timevar)
    LP.fit.solnp <- prodestLP(chilean$Y, fX = cbind(chilean$fX1, chilean$fX2), chilean$sX,
                        chilean$pX, chilean$idvar, chilean$timevar, opt = 'solnp')

    ## Not run: 
##D       # run the same model in parallel
##D       require(parallel)
##D       nCores <- as.numeric(Sys.getenv("NUMBER_OF_PROCESSORS"))
##D       cl <- makeCluster(getOption("cl.cores", nCores - 1))
##D       set.seed(154673)
##D       LP.fit.par <- prodestLP(chilean$Y, fX = cbind(chilean$fX1, chilean$fX2),
##D                       chilean$sX, chilean$pX, chilean$idvar, chilean$timevar,
##D                     cluster = cl)
##D       stopCluster(cl)
##D     
## End(Not run)

    # show results
    summary(LP.fit)
    summary(LP.fit.solnp)

    # show results in .tex tabular format
     printProd(list(LP.fit, LP.fit.solnp))
  


