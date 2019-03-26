library(ade4)


### Name: toxicity
### Title: Homogeneous Table
### Aliases: toxicity
### Keywords: datasets

### ** Examples

data(toxicity)
if(adegraphicsLoaded()) {
  table.image(toxicity$tab, labelsy = toxicity$species, labelsx = toxicity$chemicals, nclass = 7, 
    ptable.margin = list(b = 5, l = 25, t = 25, r = 5), ptable.y.pos = "left", pgrid.draw = TRUE)
  table.value(toxicity$tab, labelsy = toxicity$species, labelsx = toxicity$chemicals, 
    ptable.margin = list(b = 5, l = 5, t = 25, r = 26))
} else {
  table.paint(toxicity$tab, row.lab = toxicity$species, col.lab = toxicity$chemicals)
  table.value(toxicity$tab, row.lab = toxicity$species, col.lab = toxicity$chemicals)
}


