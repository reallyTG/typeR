library(adiv)


### Name: optimEH
### Title: Nee and May's Optimizing Process
### Aliases: optimEH
### Keywords: models

### ** Examples

data(carni70, package="adephylo")
tre <- read.tree(text=carni70$tre)
EH(tre)
optimEH(tre, 10)



