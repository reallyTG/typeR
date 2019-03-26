library(ade4)


### Name: orisaved
### Title: Maximal or minimal amount of originality saved under optimal
###   conditions
### Aliases: orisaved
### Keywords: multivariate

### ** Examples

data(carni70)
carni70.phy <- newick2phylog(carni70$tre)
tmax <- orisaved(carni70.phy, rate = 1 / 70, method = 1) 
tmin <- orisaved(carni70.phy, rate = 1 / 70, method = 2) 
plot(c(0, 1:70), tmax, xlab = "nb of species saved", ylab = "Originality saved", type = "l") 
lines(c(0, 1:70), tmin, lty = 2) 



