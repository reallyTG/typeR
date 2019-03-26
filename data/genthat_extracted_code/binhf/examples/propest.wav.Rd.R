library(binhf)


### Name: propest.wav
### Title: Proportion estimation function
### Aliases: propest.wav
### Keywords: regression

### ** Examples

## Not run: 
##D sim<-propest.wav(proportion = P2, binsize=1,length = 256, times = 1000, meth = "u", 
##D van = 6, fam = "DaubLeAsymm", min.level = 4)
##D 
##D plot(sim$x,sim$y,type="l",xlab="",ylab="Binomial mean function")
##D 
##D ##^^ shows original proportion to estimate.
##D 
##D lines(sim$x,sim$meanfhat,col=2)
##D lines(sim$x,sim$meanfhata,col=3)
##D 
##D ##^^shows the estimates of the proportion from the two transforms.
## End(Not run)



