library(prodest)


### Name: printProd
### Title: Print output - prod objects
### Aliases: printProd

### ** Examples

    data("chilean")

    # run various models
    WRDGfit <- prodestWRDG_GMM(chilean$Y, fX = cbind(chilean$fX1, chilean$fX2),
                          chilean$sX, chilean$pX, chilean$idvar, chilean$timevar)
    OPfit <- prodestOP(chilean$Y, fX = cbind(chilean$fX1, chilean$fX2), chilean$sX,
                        chilean$pX, chilean$idvar, chilean$timevar)

    # show the output in latex - tabular format
    printProd(list(OPfit, WRDGfit), modnames = c('Olley-Pakes', 'Wooldridge'),
              parnames = c('bunsk', 'bsk', 'bk'))
    # show the output on-screen - no teX format
    printProd(list(OPfit, WRDGfit), modnames = c('Olley-Pakes', 'Wooldridge'),
              parnames = c('bunsk', 'bsk', 'bk'), screen = TRUE)
  


