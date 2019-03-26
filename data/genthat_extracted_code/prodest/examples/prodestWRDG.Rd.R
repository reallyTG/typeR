library(prodest)


### Name: prodestWRDG
### Title: Estimate productivity - IV Wooldridge method
### Aliases: prodestWRDG

### ** Examples

    data("chilean")

    # we fit a model with two free (skilled and unskilled), one state (capital)
    # and one proxy variable (electricity)

    WRDG.IV.fit <- prodestWRDG_GMM(chilean$Y, fX = cbind(chilean$fX1, chilean$fX2),
                                    chilean$sX, chilean$pX, chilean$idvar, chilean$timevar)

    # show results
    WRDG.IV.fit

    ## No test: 
      # estimate a panel dataset - DGP1, various measurement errors - and run the estimation
      sim <- panelSim()

      WRDG.IV.sim1 <- prodestWRDG_GMM(sim$Y, sim$fX, sim$sX, sim$pX1, sim$idvar, sim$timevar)
      WRDG.IV.sim2 <- prodestWRDG_GMM(sim$Y, sim$fX, sim$sX, sim$pX2, sim$idvar, sim$timevar)
      WRDG.IV.sim3 <- prodestWRDG_GMM(sim$Y, sim$fX, sim$sX, sim$pX3, sim$idvar, sim$timevar)
      WRDG.IV.sim4 <- prodestWRDG_GMM(sim$Y, sim$fX, sim$sX, sim$pX4, sim$idvar, sim$timevar)

      # show results in .tex tabular format
      printProd(list(WRDG.IV.sim1, WRDG.IV.sim2, WRDG.IV.sim3, WRDG.IV.sim4),
                parnames = c('Free','State'))
    
## End(No test)
  


