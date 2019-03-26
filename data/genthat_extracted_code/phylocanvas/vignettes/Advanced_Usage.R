## ----setup, include=FALSE------------------------------------------------
knitr::opts_chunk$set(echo = TRUE)
suppressMessages(library(magrittr))

## ----warning=FALSE-------------------------------------------------------
library(magrittr)
library(ape)
library(phylocanvas)

data("bird.families")
phylocanvas(bird.families, treetype = "radial", 
            width = 700, textsize = 10, nodesize = 10)

## ----warning=FALSE-------------------------------------------------------

# add internal nodenames
birds  <- makeNodeLabel(bird.families)

# convert to phylo4 which has a few nice convenicnece methods including the
# ability to get names with nodes.
birds <- phylobase::phylo4(birds)

# get MRCA
node  <- phylobase::MRCA(birds,c("Cerylidae", "Upupidae"))

# get the node name
nodename <- names(node)

# highlight all submembers of the MRCA
phylocanvas(birds, width = 700, textsize = 10, nodesize = 10) %>%
  select_branch(nodeid=nodename, cascade=T)

## ---- warning=FALSE------------------------------------------------------
phylocanvas(birds, width = 700, textsize = 10, nodesize = 10, treetype = "radial") %>% 
  select_branch(nodeid=nodename, cascade=T)


## ----warning=FALSE-------------------------------------------------------
phycanv     <- phylocanvas(birds, width = 700, textsize = 10, nodesize = 10, treetype = "radial") 
nodenames   <- get.descendants(birds, nodename)
clade2names <- get.descendants(birds, phylobase::MRCA(birds, c("Pteroclidae", "Jacanidae")))

for (nodename in nodenames) {
  phycanv <- style_node(phycanv, nodeid = nodename, fillcolor="green")
}
for (nodename in clade2names) {
  phycanv <- style_node(phycanv, nodeid = nodename, fillcolor="red")
}


phycanv



