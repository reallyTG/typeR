library(far)


### Name: simul.far.wiener
### Title: FAR(1) process simulation with Wiener noise
### Aliases: simul.far.wiener
### Keywords: ts misc

### ** Examples

  far1 <- simul.far.wiener(m=64,n=100)
  summary(far1)
  print(far(far1,kn=4))
  par(mfrow=c(2,1))
  plot(far1,date=1)
  plot(select.fdata(far1,date=1:5),whole=TRUE,separator=TRUE)



