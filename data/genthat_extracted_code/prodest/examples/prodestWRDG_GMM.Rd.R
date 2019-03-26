library(prodest)


### Name: prodestWRDG_GMM
### Title: Estimate productivity - Wooldridge method
### Aliases: prodestWRDG_GMM

### ** Examples

    data("chilean")

    # we fit a model with two free (skilled and unskilled), one state (capital)
    # and one proxy variable (electricity)

    WRDG.GMM.fit <- prodestWRDG_GMM(chilean$Y, fX = cbind(chilean$fX1, chilean$fX2),
                              chilean$sX, chilean$pX, chilean$idvar, chilean$timevar)

    # show results
    WRDG.GMM.fit

    ## No test: 
      # estimate a panel dataset - DGP1, various measurement errors - and run the estimation
      sim <- panelSim()

      WRDG.GMM.sim1 <- prodestWRDG_GMM(sim$Y, sim$fX, sim$sX, sim$pX1, sim$idvar, sim$timevar)
      WRDG.GMM.sim2 <- prodestWRDG_GMM(sim$Y, sim$fX, sim$sX, sim$pX2, sim$idvar, sim$timevar)
      WRDG.GMM.sim3 <- prodestWRDG_GMM(sim$Y, sim$fX, sim$sX, sim$pX3, sim$idvar, sim$timevar)
      WRDG.GMM.sim4 <- prodestWRDG_GMM(sim$Y, sim$fX, sim$sX, sim$pX4, sim$idvar, sim$timevar)

      # show results in .tex tabular format
      printProd(list(WRDG.GMM.sim1, WRDG.GMM.sim2, WRDG.GMM.sim3, WRDG.GMM.sim4),
                      parnames = c('Free','State'))
    
## End(No test)
 


