library(betapart)


### Name: boot.coefs.decay
### Title: Bootstrapping the parameters of distance-decay models computed
###   with decay.model()
### Aliases: boot.coefs.decay

### ** Examples

require(vegan)

data(BCI)
## UTM Coordinates (in metres)
UTM.EW <- rep(seq(625754, 626654, by=100), each=5)
UTM.NS <- rep(seq(1011569,  1011969, by=100), len=50)

spat.dist<-dist(data.frame(UTM.EW, UTM.NS))

dissim.BCI<-beta.pair.abund(BCI)$beta.bray.bal

BCI.decay.pow<-decay.model(dissim.BCI, spat.dist, model.type="pow", perm=100)

boot.coefs.decay(BCI.decay.pow, 50)



