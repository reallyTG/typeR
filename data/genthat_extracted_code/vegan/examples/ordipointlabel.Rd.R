library(vegan)


### Name: ordipointlabel
### Title: Ordination Plots with Points and Optimized Locations for Text
### Aliases: ordipointlabel plot.ordipointlabel
### Keywords: hplot aplot

### ** Examples

data(dune)
ord <- cca(dune)
plt <- ordipointlabel(ord)

## set scaling - should be no warnings!
ordipointlabel(ord, scaling = "sites")

## plot then add
plot(ord, scaling = "symmetric", type = "n")
ordipointlabel(ord, display = "species", scaling = "symm", add = TRUE)
ordipointlabel(ord, display = "sites", scaling = "symm", add = TRUE)

## redraw plot without rerunning SANN optimisation
plot(plt)



