library(RSEIS)


### Name: INSTresponse
### Title: Instrument Respnse Function
### Aliases: INSTresponse
### Keywords: misc hplot

### ** Examples



########  set list of possible instruments:
Kal  <-  PreSet.Instr()
###  get instrument reponse for first in list:
resp1   <-  INSTresponse(Kal, 1, c(0,100)  , tt=c(1,0.008), plotkey=TRUE)
###  plots amplitude and phase



