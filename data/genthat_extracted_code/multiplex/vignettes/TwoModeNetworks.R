## ----setup, include=FALSE-----------------------------------------------------------------------------------
knitr::opts_chunk$set(size = 'footnotesize', background = '#FFFFFF', prompt = TRUE, strip.white = FALSE, comment = NA)
options(width=110)
knitr::knit_hooks$set(small.mar = function(before, options, envir) {
    if (before) par(mar = c(4, 4, .1, .1))  # smaller margin on top and right
})

## ----data, echo=-6------------------------------------------------------------------------------------------
## Fruits data set with attributes
frt <- data.frame(yellow = c(0,1,0,0,1,0,0,0), green = c(0,0,1,0,0,0,0,1), red = c(1,0,0,1,0,0,0,0), 
                  orange = c(0,0,0,0,0,1,1,0), apple = c(1,1,1,1,0,0,0,0), citrus = c(0,0,0,0,1,1,1,1))
## Label the objects
rownames(frt) <- c("PinkLady","GrannySmith","GoldenDelicious","RedDelicious","Lemon","Orange","Mandarin","Lime")
frt

## ----loadmultiplex------------------------------------------------------------------------------------------
## Load first the package
library("multiplex")

## ----galoisFull---------------------------------------------------------------------------------------------
## Galois representation between objects and attributes
galois(frt)

## ----galoisReduc, echo=-2-----------------------------------------------------------------------------------
gc <- galois(frt, labeling = "reduced")
galois(frt, labeling = "reduced")

## ----strgaloisReduc, size='scriptsize'----------------------------------------------------------------------
str(gc$full)

## ----partialorder, echo=-3----------------------------------------------------------------------------------
## Partial ordering of the formal concepts with established labels
pogcc <- partial.order(gc, type = "galois", lbs = paste("c", 1:length(gc$full), sep = ""))
pogcc

## ----pogc---------------------------------------------------------------------------------------------------
## First we assign the partial order of the reduced context to 'pogc'
pogc <- partial.order(gc, type = "galois")

## ----diagrampogc, fig.pos='H', fig.width=4.5, fig.height=4.5, fig.align='center', fig.cap='Concept Lattice of the fruits and their characteristics', echo=-1, small.mar=TRUE----
par(mar=c(0,0,0,0))
## Plot the lattice diagram
if( require("Rgraphviz", quietly = TRUE)) {
diagram(pogc)
}

## ----diaglevels, echo=TRUE----------------------------------------------------------------------------------
## Diagram levels
if( require("Rgraphviz", quietly = TRUE)) {
diagram.levels(pogcc) }

## ----diaglevelsperm, echo=TRUE, message=FALSE, warning=FALSE------------------------------------------------
## Diagram levels with permutation
if( require("Rgraphviz", quietly = TRUE)) {
diagram.levels(pogcc, perm = TRUE) }

## ----princfltrlbs, echo=TRUE--------------------------------------------------------------------------------
## Principal filter of the third concept 
fltr(3, pogc)

## ----princfltrlbs2, echo=TRUE, eval=FALSE-------------------------------------------------------------------
#  ## Principal filter of the concept with these labels
#  fltr("PinkLady", pogc)
#  fltr(c("red", "RedDelicious"), pogc)

## ----filter, echo=TRUE--------------------------------------------------------------------------------------
## Filter of two concepts
fltr(c("Lemon", "Lime"), pogc)

## ----ideal, echo=TRUE---------------------------------------------------------------------------------------
## Ideal of two concepts
fltr(c(9, 11), pogc, ideal = TRUE)

## ----bipp, echo=TRUE, eval=TRUE, fig.pos='H', fig.width=4, fig.height=4, fig.align='center', fig.env='figure', fig.cap='Bipartite graph'----
## Load the "multigraph" package
library("multigraph")

## Plot bipartite graph
bmgraph(frt, pch = 16:15)

## ----binp2, echo=TRUE, eval=FALSE---------------------------------------------------------------------------
#  ## Plot proyection of bipartite network
#  bmgraph(frt, layout = "stress", seed = 1, cex = 3, vcol = 8, pch = 16:15)

## ----binp, fig.pos='H', fig.width=5, fig.height=5, fig.align='center', fig.env='figure', fig.cap='Bipartite graph with force-directed layout', echo=FALSE----
bmgraph(frt, layout = "force", seed = 1, cex = 3, vcol = 8, pch = 16:15)

