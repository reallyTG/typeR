library(prodest)


### Name: prodestOP
### Title: Estimate productivity - Olley-Pakes method
### Aliases: prodestOP

### ** Examples

    require(prodest)

    ## Chilean data on production.The full version is Publicly available at
    ## http://www.ine.cl/canales/chile_estadistico/estadisticas_economicas/industria/
    ## series_estadisticas/series_estadisticas_enia.php

    data(chilean)

    # we fit a model with two free (skilled and unskilled), one state (capital)
    # and one proxy variable (electricity)

    OP.fit <- prodestOP(chilean$Y, fX = cbind(chilean$fX1, chilean$fX2), chilean$sX,
                        chilean$inv, chilean$idvar, chilean$timevar)
    OP.fit.solnp <- prodestOP(chilean$Y, fX = cbind(chilean$fX1, chilean$fX2),
                              chilean$sX, chilean$inv, chilean$idvar,
                              chilean$timevar, opt='solnp')
    OP.fit.control <- prodestOP(chilean$Y, fX = cbind(chilean$fX1, chilean$fX2),
                                chilean$sX, chilean$inv, chilean$idvar,
                                chilean$timevar, cX = chilean$cX)
    OP.fit.attrition <- prodestOP(chilean$Y, fX = cbind(chilean$fX1, chilean$fX2),
                                chilean$sX, chilean$inv, chilean$idvar,
                                chilean$timevar, exit = TRUE)

    # show results
    summary(OP.fit)
    summary(OP.fit.solnp)
    summary(OP.fit.control)

    # show results in .tex tabular format
     printProd(list(OP.fit, OP.fit.solnp, OP.fit.control, OP.fit.attrition))



