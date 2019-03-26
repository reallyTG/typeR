library(RXshrink)


### Name: RXtsimu
### Title: True Squared Error LOSS of Shrinkage for a Simulated Response
###   Y-vector
### Aliases: RXtsimu
### Keywords: regression

### ** Examples

  data(haldport)
  form <- heat~p3ca+p3cs+p4caf+p2cs
  rxrobj <- RXridge(form, data=haldport)
  plot(rxrobj)
  # define true parameter values.
  trugam <- matrix(c(.8,.0,.3,.5),4,1)
  trusig <- 0.2
  # create true shrinkage MSE risk scenario.
  trumse <- RXtrisk(form, data=haldport, trugam, trusig, Q=-5)
  # calculate true shrinkage squared error losses.
  trusim <- RXtsimu(form, data=haldport, trugam, trusig, Q=-5)
  haldpsim <- haldport
  haldpsim[,5] <- trusim$ydat[,1]
  rxsobj <- RXridge(form, data=haldpsim) # analysis as if parameters unknown
  plot(rxsobj)



