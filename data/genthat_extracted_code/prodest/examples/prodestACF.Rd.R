library(prodest)


### Name: prodestACF
### Title: Estimate productivity - Ackerberg-Caves-Frazer correction
### Aliases: prodestACF

### ** Examples


    require(prodest)

    ## Chilean data on production.The full version is Publicly available at
    ## http://www.ine.cl/canales/chile_estadistico/estadisticas_economicas/industria/
    ## series_estadisticas/series_estadisticas_enia.php

    data(chilean)

    # we fit a model with two free (skilled and unskilled), one state (capital)
    # and one proxy variable (electricity)

    ACF.fit <- prodestACF(chilean$Y, fX = cbind(chilean$fX1, chilean$fX2), chilean$sX,
                          chilean$pX, chilean$idvar, chilean$timevar,
                          theta0 = c(.5,.5,.5), R = 5)
    ## No test: 
      set.seed(154673)
      ACF.fit.solnp <- prodestACF(chilean$Y, fX = cbind(chilean$fX1, chilean$fX2), chilean$sX,
                            chilean$pX, chilean$idvar, chilean$timevar,
                            theta0 = c(.5,.5,.5), opt = 'solnp')

      # run the same regression in parallel
      # nCores <- as.numeric(Sys.getenv("NUMBER_OF_PROCESSORS")) # Windows systems
      nCores <- 3
      cl <- makeCluster(getOption("cl.cores", nCores - 1))
      set.seed(154673)
      ACF.fit.par <- prodestACF(chilean$Y, fX = cbind(chilean$fX1, chilean$fX2), chilean$sX,
                                chilean$pX, chilean$idvar, chilean$timevar,
                                theta0 = c(.5,.5,.5), cluster = cl)
      stopCluster(cl)

      # show results
      coef(ACF.fit)
      coef(ACF.fit.solnp)

       # show results in .tex tabular format
       printProd(list(ACF.fit, ACF.fit.solnp))
    
## End(No test)
  


