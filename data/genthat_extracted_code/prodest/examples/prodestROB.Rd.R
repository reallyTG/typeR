library(prodest)


### Name: prodestROB
### Title: Estimate productivity - Robinson-Wooldridge method
### Aliases: prodestROB

### ** Examples

    data("chilean")

    # we fit a model with two free (skilled and unskilled), one state (capital)
    # and one proxy variable (electricity)

    ROB.IV.fit <- prodestROB(chilean$Y, fX = cbind(chilean$fX1, chilean$fX2),
                                   chilean$sX, chilean$pX, chilean$idvar, chilean$timevar)

    # show results
    ROB.IV.fit

    ## No test: 
      # estimate a panel dataset - DGP1, various measurement errors - and run the estimation
      sim <- panelSim()

      ROB.IV.sim1 <- prodestROB(sim$Y, sim$fX, sim$sX, sim$pX1, sim$idvar, sim$timevar)
      ROB.IV.sim2 <- prodestROB(sim$Y, sim$fX, sim$sX, sim$pX2, sim$idvar, sim$timevar)
      ROB.IV.sim3 <- prodestROB(sim$Y, sim$fX, sim$sX, sim$pX3, sim$idvar, sim$timevar)
      ROB.IV.sim4 <- prodestROB(sim$Y, sim$fX, sim$sX, sim$pX4, sim$idvar, sim$timevar)

      # show results in .tex tabular format
      printProd(list(ROB.IV.sim1, ROB.IV.sim2, ROB.IV.sim3, ROB.IV.sim4),
                parnames = c('Free','State'))
    
## End(No test)
  


