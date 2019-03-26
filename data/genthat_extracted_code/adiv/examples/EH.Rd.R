library(adiv)


### Name: EH
### Title: Faith Phylogenetic Diversity
### Aliases: EH
### Keywords: models

### ** Examples

data(carni70, package = "adephylo")
tre <- read.tree(text = carni70$tre)
EH(tre)
EH(tre, select=c("Mustela.nigripes", "Mustela.frenata", "Puma.concolor"))
EH(tre, select=c(1,68,70))



