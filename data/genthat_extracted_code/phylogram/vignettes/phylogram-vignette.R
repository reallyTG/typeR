## ---- echo = FALSE, message = FALSE, warning = FALSE---------------------
#knitr::opts_chunk$set(out.width='750px', dpi=200)
knitr::opts_chunk$set(collapse = TRUE, comment = "#>", dpi=500, out.width='500px',
                      fig.path = 'figures/')

## ---- fig.keep='none'----------------------------------------------------
library(phylogram)
x <- read.dendrogram(text = "(A,(B,C));")
plot(x, yaxt = "n")

## ---- echo=FALSE, fig.height=1.5, fig.width=3, fig.align='left', dpi=500----
par(mar = c(1, 1, 1, 1))
plot(x, yaxt = "n")

## ------------------------------------------------------------------------
write.dendrogram(x, edges = FALSE)

## ---- message = FALSE, fig.height=4, fig.width=10, fig.align='left', out.width= '1000px'----
library(ape)
data(woodmouse)
## generate distance matrices for each section of the alignment
dist1 <- dist.dna(woodmouse[, 1:482])
dist2 <- dist.dna(woodmouse[, 483:965])
## build neighbor-joining trees
phy1 <- nj(dist1)
phy2 <- nj(dist2)
## root with No0912S as outgroup
phy1 <- root(phy1, "No0912S")
phy2 <- root(phy2, "No0912S")
## convert phylo objects to dendrograms
dnd1 <- as.dendrogram(phy1)
dnd2 <- as.dendrogram(phy2)
## rearrange in ladderized fashion
dnd1 <- ladder(dnd1)
dnd2 <- ladder(dnd2)
## plot the tanglegram
dndlist <- dendextend::dendlist(dnd1, dnd2)
dendextend::tanglegram(dndlist, fast = TRUE, margin_inner = 5)

## ---- fig.keep='none'----------------------------------------------------
x <- list(1, list(2, 3))
## attach "leaf" and "label" attributes to leaf nodes
attr(x[[1]], "leaf") <- TRUE
attr(x[[2]][[1]], "leaf") <- attr(x[[2]][[2]], "leaf") <- TRUE
attr(x[[1]], "label") <- "A"
attr(x[[2]][[1]], "label") <- "B"
attr(x[[2]][[2]], "label") <- "C"
## set "height" attributes for all nodes
attr(x, "height") <- 2
attr(x[[1]], "height") <- 0
attr(x[[2]], "height") <- 1
attr(x[[2]][[1]], "height") <- attr(x[[2]][[2]], "height") <- 0
## set "midpoints" attributes for all nodes
attr(x, "midpoint") <- 0.75
attr(x[[1]], "midpoint") <- 0
attr(x[[2]], "midpoint") <- 0.5
attr(x[[2]][[1]], "midpoint") <- attr(x[[2]][[2]], "midpoint") <- 0
## set "members" attributes for all nodes
attr(x, "members") <- 3
attr(x[[1]], "members") <- 1
attr(x[[2]], "members") <- 2
attr(x[[2]][[1]], "members") <- attr(x[[2]][[2]], "members") <- 1
## set class as "dendrogram" 
## Note that setting the class for the root node
## automatically sets the class of all nested subnodes
class(x) <- "dendrogram"
x

## ------------------------------------------------------------------------
x <- list(1, list(2, 3))
## recursively set class, midpoint, members and leaf attributes
x <- remidpoint(x)
## set incremental height attributes
x <- as.cladogram(x)
## set label attributes using dendrapply
set_label <- function(node){
  if(is.leaf(node)) attr(node, "label") <- LETTERS[node]
  return(node)
}
x <- dendrapply(x, set_label)
x

## ---- fig.keep='none'----------------------------------------------------
## isolate root node (species C)
ancestor <- prune(x, pattern = "C", keep = TRUE) 
## alternative option using subset operator
ancestor <- x[[2]][[2]]
## create subtree without species C
subtree <- prune(x, pattern = "C")
## graft subtree onto root
x <- list(ancestor, subtree)
## set attributes as above
x <- as.cladogram(remidpoint(x))
## plot dendrogram
plot(x, yaxt = "n")

## ---- echo=FALSE, fig.height=1.5, fig.width=3, fig.align='left', dpi=500----
par(mar = c(1, 1, 1, 1))
plot(x, yaxt = "n")

