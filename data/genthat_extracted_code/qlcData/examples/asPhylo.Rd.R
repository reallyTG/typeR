library(qlcData)


### Name: asPhylo
### Title: Convert Glottolog trees to phylo format
### Aliases: asPhylo

### ** Examples

# many different effects can be achieved by combining options

isoCodes <- c("deu", "eng", "swe", "swh", "xho", "fin")
treeWithInternal <- getTree(isoCodes, reduce = FALSE)
treeNoInternal <- getTree(isoCodes, reduce = TRUE)

## Not run: 
##D # to understand the influence of the option 'reduce' also check
##D library(data.tree)
##D plot(FromDataFrameNetwork(treeWithInternal))
##D plot(FromDataFrameNetwork(treeNoInternal))
## End(Not run)

library(ape)
par(mfcol = c(2,3))

phylo <- asPhylo(treeWithInternal, height = 20)
plot(phylo, main = "reduce = FALSE\nheight = 20", cex = 1)
edgelabels(round(phylo$edge.length), cex = 1.5)

phylo <- asPhylo(treeNoInternal, height = 20)
plot(phylo, main = "reduce = TRUE\nheight = 20", cex = 1)
edgelabels(round(phylo$edge.length), cex = 1.5)

phylo <- asPhylo(treeWithInternal, fixed.branches = 1)
plot(phylo, main = "reduce = FALSE\nfixed.branches = 1", cex = 1)
edgelabels(round(phylo$edge.length), cex = 1.5)

phylo <- asPhylo(treeNoInternal, fixed.branches = 1)
plot(phylo, main = "reduce = TRUE\nfixed.branches = 1", cex = 1)
edgelabels(round(phylo$edge.length), cex = 1.5)

phylo <- asPhylo(treeWithInternal, fixed.branches = 1, long.root = 10)
plot(phylo, main = "reduce = FALSE\nfixed.branches = 1\nlong.root = 10", cex = 1)
edgelabels(round(phylo$edge.length), cex = 1.5)

phylo <- asPhylo(treeNoInternal, fixed.branches = 1, long.root = 10)
plot(phylo, main = "reduce = TRUE\nfixed.branches = 1\nlong.root = 10", cex = 1)
edgelabels(round(phylo$edge.length), cex = 1.5)

par(mfcol=c(1,1))




