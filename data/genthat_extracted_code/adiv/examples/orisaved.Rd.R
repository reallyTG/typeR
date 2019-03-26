library(adiv)


### Name: orisaved
### Title: Maximal or Minimal Amount of Originality Saved under Optimal
###   Conditions
### Aliases: orisaved
### Keywords: models

### ** Examples

data(carni70, package="adephylo")
tre <- read.tree(text=carni70$tre)
tmax <- orisaved(tre, rate = 1 / 70, method = 1) 
tmin <- orisaved(tre, rate = 1 / 70, method = 2) 
plot(c(0, 1:70), tmax, xlab = "nb of species saved", ylab = "Originality saved", type = "l") 
lines(c(0, 1:70), tmin, lty = 2) 



