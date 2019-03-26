## ---- echo = FALSE, message = FALSE, warning = FALSE---------------------
#knitr::opts_chunk$set(out.width='750px', dpi=200)
knitr::opts_chunk$set(collapse = TRUE, comment = "#>", dpi=500, out.width='500px')

## ------------------------------------------------------------------------
library(ape)
data(woodmouse)
## view the first few rows and columns 
as.character.DNAbin(woodmouse[1:5, 1:5])

## ------------------------------------------------------------------------
woodmouse <- woodmouse[, apply(woodmouse, 2, function(v) !any(v == 0xf0))]

## ------------------------------------------------------------------------
### Compute the full distance matrix and print the first few rows and columns
library(kmer)
woodmouse.kdist <- kdistance(woodmouse, k = 6)
print(as.matrix(woodmouse.kdist)[1:7, 1:7], digits = 2)

### Compute and print the embedded distance matrix
set.seed(999)
seeds <- sample(1:15, size = 3)
woodmouse.mbed <- mbed(woodmouse, seeds = seeds, k = 6)
print(woodmouse.mbed[,], digits = 2)

## ---- message = FALSE, fig.height=4, fig.width=10, fig.align='left', out.width= '700px'----
## compute pairwise distance matrices
woodmouse.dist <- ape::dist.dna(woodmouse, model = "K80") 
woodmouse.kdist <- kdistance(woodmouse, k = 11) 

## build neighbor-joining trees
phy1 <- ape::nj(woodmouse.dist)
phy2 <- ape::nj(woodmouse.kdist)

## rearrange trees in ladderized fashion
dnd1 <- ape::ladderize(phy1)
dnd2 <- ape::ladderize(phy2)

## convert phylo objects to dendrograms
dnd1 <- phylogram::as.dendrogram(phy1)
dnd2 <- phylogram::as.dendrogram(phy2)

## plot the tanglegram
dndlist <- dendextend::dendlist(dnd1, dnd2)
dendextend::tanglegram(dndlist, fast = TRUE, margin_inner = 5)


## ------------------------------------------------------------------------
set.seed(999)
woodmouse.OTUs <- otu(woodmouse, k = 5, threshold = 0.97, method = "farthest", nstart = 20)
woodmouse.OTUs

