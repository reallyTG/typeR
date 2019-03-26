library(adiv)


### Name: randEH
### Title: Amount of Evolutionary History Preserved when Random Species are
###   Saved
### Aliases: randEH
### Keywords: models

### ** Examples

data(carni70, package = "adephylo")
tre <- read.tree(text=carni70$tre)
EH(tre)
R <- randEH(tre, 10, nrep=1000)
hist(R)



