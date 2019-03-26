library(cytometree)


### Name: plot_cytopop
### Title: Plot the cell count for each population using CytomeTree.
### Aliases: plot_cytopop

### ** Examples


# Run CytomeTree
data(DLBCL)
cellevents <- DLBCL[,c("FL1", "FL2", "FL4")]
Tree <- CytomeTree(cellevents, minleaf = 1, t=.1)
Annot <- Annotation(Tree,plot=FALSE)

# Plot the cell count
plot_cytopop(Annot)



