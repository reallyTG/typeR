library(prodlim)


### Name: getEvent
### Title: Extract a column from an event history object.
### Aliases: getEvent
### Keywords: survival

### ** Examples


  dat= data.frame(time=1:5,event=letters[1:5])
  x=with(dat,Hist(time,event))
  ## inside integer
  unclass(x)
  ## extract event (the extra level "unknown" is for censored data)
  getEvent(x)




