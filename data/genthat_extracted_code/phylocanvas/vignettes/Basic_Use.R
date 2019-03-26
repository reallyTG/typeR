## ----setup, include=FALSE------------------------------------------------
knitr::opts_chunk$set(echo = TRUE)
suppressMessages(library(magrittr))

## ---- message=FALSE------------------------------------------------------
library(magrittr)
library(phylocanvas)

tree = ape::read.tree(text = "(A:0.1,B:0.2,(C:0.3,D:0.4)E:0.5)F;")
phycanv <- phylocanvas(tree, treetype = "rectangular", alignlabels = T)

## ------------------------------------------------------------------------
phycircle <- phylocanvas(tree, treetype = "circular", nodesize = 30, linewidth = 10)
phycircle

## ------------------------------------------------------------------------
# Note that colors are names, rgbs or hex
phycanv %>%
  style_node("A", nodesizeratio = 4, fillcolor="rgb(0, 255, 0)") %>% 
  style_node("B", fillcolor = "blue") %>%
  style_node("C", labeltextsize = 10, shape="triangle") %>%
  style_node("D", fillcolor="#ffa500", highlighted=TRUE) 

## ------------------------------------------------------------------------
phycircle %>% collapse_branch("E")

## ------------------------------------------------------------------------
phycircle %>% rotate_branch("E")

## ------------------------------------------------------------------------
phycanv %>% select_branch("B")

phycanv %>% select_branch("E", cascade=TRUE)


## ------------------------------------------------------------------------
phycanv %>% highlight_node("B")


## ------------------------------------------------------------------------
# Note the scalebar is active
tree = ape::read.tree(text="(A:0.1,B:0.2,(C:0.3,D:0.4)E:0.5)F;")
phylocanvas(tree, showscalebar = TRUE)

