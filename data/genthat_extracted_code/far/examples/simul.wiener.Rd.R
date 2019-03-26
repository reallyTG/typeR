library(far)


### Name: simul.wiener
### Title: Wiener process simulation
### Aliases: simul.wiener
### Keywords: ts misc

### ** Examples

  noise <- simul.wiener(m=64,n=100,m2=512)
  summary(noise)
  par(mfrow=c(2,1))
  plot(noise,date=1)
  plot(select.fdata(noise,date=1:5),whole=TRUE,separator=TRUE)



