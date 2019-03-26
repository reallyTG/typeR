library(warbleR)


### Name: phylo_spectro
### Title: Add spectrograms onto phylogenetic trees
### Aliases: phylo_spectro

### ** Examples

{ 
## No test: 
# First set empty folder
# setwd(tempdir())

# save example sound files
data(list = c("Phae.long1", "Phae.long2", "Phae.long3", "selec.table"))
writeWave(Phae.long1,"Phae.long1.wav")
writeWave(Phae.long2,"Phae.long2.wav")
writeWave(Phae.long3,"Phae.long3.wav")

# set spectrogram options (can be done at the phylo_spectro() function too)
warbleR_options(wl = 200, ovlp = 90, flim = "frange")

# subset example selection table
X <- selec.table[1:8, ]

# create random tree (need ape to be installed)
set.seed(1)
tree <- ape::rtree(nrow(X))

# Force tree to be ultrametric
tree <- ape::chronoMPL(tree)

# add tip label column to example selection table (just for the sake of the example)
X$tip.label <- tree$tip.label

# print phylogram with spectros
phylo_spectro(X = X, tree = tree, par.mar = c(0, 0, 0, 8), size = 2)

# no margin in spectrograms and showing tip labels (higher offset)
phylo_spectro(X = X, tree = tree, offset = 0.1, par.mar = c(0, 0, 0, 6), 
inner.mar = rep(0, 4), size = 2)

# print fan tree and no margin in spectrograms
phylo_spectro(X = X, tree = tree, offset = 0.6, par.mar = rep(3, 4),
inner.mar = rep(0, 4), size = 2, type = "fan", show.tip.label = FALSE)

# changing edge color and witdh
phylo_spectro(X = X, tree = tree, offset = 0.2, par.mar = rep(3, 4), inner.mar = rep(0, 4), 
size = 2, type = "fan", show.tip.label = FALSE, edge.color = "red", edge.width = 2)

# plotting a tree representing cross-correlation distances 
xcorr_mat <- xcorr(X, bp = c(1, 10))

xc.tree <- ape::chronoMPL(ape::as.phylo(hclust(as.dist(1 - xcorr_mat))))

X$tip.label <- xc.tree$tip.label

phylo_spectro(X = X, tree = xc.tree, offset = 0.03, par.mar = rep(3, 4), 
inner.mar = rep(0, 4), size = 0.3, type = "fan", show.tip.label = FALSE, 
edge.color = "red", edge.width = 2)
  
## End(No test)
}



