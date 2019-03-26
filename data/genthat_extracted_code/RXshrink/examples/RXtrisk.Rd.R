library(RXshrink)


### Name: RXtrisk
### Title: True MSE Risk of Shrinkage Resulting from Known Regression
###   Parameters
### Aliases: RXtrisk
### Keywords: regression

### ** Examples

  data(mpg)  
  form <- mpg~cylnds+cubins+hpower+weight
  rxrobj <- RXridge(form, data=mpg)
  # define true parameter values.
  trugam <- matrix(c(-.5,-.1,.1,-.6),4,1)
  trusig <- 0.4
  # create true shrinkage MSE risk scenario.
  trumse <- RXtrisk(form, data=mpg, trugam, trusig, Q=-1, steps=4)
  plot(trumse)
  str(trumse)



