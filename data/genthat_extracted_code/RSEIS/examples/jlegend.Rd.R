library(RSEIS)


### Name: jlegend
### Title: plot a legend
### Aliases: jlegend
### Keywords: aplot

### ** Examples



plot(c(0,1), c(0,1))
u  <-  par('usr')
LEG  <-  jlegend( u[1], u[4], c("Vp", "Vs"),
            lwd=2, col=c(4,3), plot=FALSE  )

 



