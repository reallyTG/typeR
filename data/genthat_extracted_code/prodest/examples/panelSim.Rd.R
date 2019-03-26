library(prodest)


### Name: panelSim
### Title: Simulate Panel dataset
### Aliases: panelSim

### ** Examples


  require(prodest)

  ## Simulate a dataset with 100 firms (T = 50).
  ## \code{Panelsim()} delivers the last 10% of usable time per panel.

  panel.data <- panelSim(N = 100, T = 50)
  attach(panel.data)

  ## Estimate various models
  ACF.fit <- prodestACF(Y, fX, sX, pX2, idvar, timevar, theta0 = c(.5,.5))
  ## No test: 
    LP.fit <- prodestLP(Y, fX, sX, pX2, idvar, timevar)
    WRDG.fit <- prodestWRDG(Y, fX, sX, pX3, idvar, timevar)

    ## print results in lateX tabular format
    printProd(list(LP.fit, ACF.fit, WRDG.fit))
  
## End(No test)



