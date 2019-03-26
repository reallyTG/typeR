library(far)


### Name: simul.far.sde
### Title: FAR-SDE process simulation
### Aliases: simul.far.sde
### Keywords: ts misc

### ** Examples

  far1 <- simul.far.sde()
  summary(far1)
  print(far(far1,kn=2))
  par(mfrow=c(2,1))
  plot(far1,date=1)
  plot(select.fdata(far1,date=1:5),whole=TRUE,separator=TRUE)




