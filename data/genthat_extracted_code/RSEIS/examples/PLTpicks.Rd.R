library(RSEIS)


### Name: PLTpicks
### Title: Plot picks on seismic record
### Aliases: PLTpicks
### Keywords: aplot

### ** Examples


ex  <-  seq(from=0, to=4*pi, length = 200)

y  <-  sin(ex)
picks = c(0.5*pi, 2.3*pi)
plot(ex, y, type='l')


PLTpicks(picks, labs =c("P","P")  , cols =c('red','green')  )

PLTpicks(picks+2, labs =c("S","PKIKP") , cols ='blue'  )




