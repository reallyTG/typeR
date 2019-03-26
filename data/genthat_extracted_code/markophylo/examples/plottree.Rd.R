library(markophylo)


### Name: plottree
### Title: Plot the tree used with different hypothesized branch groupings
###   (or clades) following unique rates coloured differently.
### Aliases: plottree

### ** Examples

data(simdata2)
model2 <- estimaterates(usertree = simdata2$tree, userphyl = simdata2$data, 
                        alphabet = c(1, 2), bgtype = "ancestornodes", bg = c(7),
                        rootprob = "equal", modelmat = matrix(c(NA, 1, 2, NA), 2, 2))
plottree(model2, colors=c("blue", "darkgreen"), edge.width = 2, show.tip.label = FALSE, 
         no.margin = TRUE)
ape::nodelabels(frame = "circle", cex = 0.7)
ape::tiplabels(frame = "circle", cex = 0.7)



