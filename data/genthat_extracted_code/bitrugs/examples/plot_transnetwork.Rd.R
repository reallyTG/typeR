library(bitrugs)


### Name: plot_transnetwork
### Title: Plot transmission networks
### Aliases: plot_transnetwork

### ** Examples

  data(mcmcoutput)
  data(hospitaldata)
  par(mar=c(0,0,2,0))
  w <- sample(1:100,100)
  plot_transnetwork(mcmcoutput, epidata=hospitaldata$epi, 
    type=c(3,1), plotthresh=0.05, labels="ID", text.cex=1.2, 
    adj=0.5, ID=w, n=100)



