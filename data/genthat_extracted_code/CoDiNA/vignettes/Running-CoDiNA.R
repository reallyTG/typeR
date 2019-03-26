## ----setup, include = FALSE----------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ----wTO-----------------------------------------------------------------
require(wTO)
require(CoDiNA)
require(magrittr)

wTO_out = wTO.fast(Data = Microarray_Expression1, n = 100)

wTO_filtered = subset(wTO_out, p.adjust(wTO_out$pval) < 0.05, select = c('Node.1', 'Node.2', 'wTO'))

## ----MakeDiffNet---------------------------------------------------------
DiffNet = MakeDiffNet(Data = list(CTR, OLI, AST), Code = c('CTR', 'OLI', 'AST'))

DiffNet

print(DiffNet) %>% head()

## ----ClusterNodes--------------------------------------------------------
int_C = quantile(DiffNet$Score_internal, 0.5)
ext_C = quantile(DiffNet$Score_Phi, 0.5)

Nodes_Groups = ClusterNodes(DiffNet = DiffNet, cutoff.external = ext_C, cutoff.internal = int_C)
table(Nodes_Groups$Phi_tilde)

## ----ClusterNodes2-------------------------------------------------------
int_C = quantile(DiffNet$Score_internal, 0.25)
ext_C = quantile(DiffNet$Score_Phi, 0.75)

Nodes_Groups = ClusterNodes(DiffNet = DiffNet, cutoff.external = ext_C, cutoff.internal = int_C)
table(Nodes_Groups$Phi_tilde)

## ----plot----------------------------------------------------------------
int_C = quantile(DiffNet$Score_internal, 0.25)
ext_C = quantile(DiffNet$Score_Phi, 0.75)

Graph = plot(DiffNet, cutoff.external = ext_C, cutoff.internal = int_C, layout = 'layout_components', path = 'Vis.html')


## ----plotigraph----------------------------------------------------------

g = as.igraph(Graph) 

require(igraph)

plot(g, layout = layout.fruchterman.reingold(g), vertex.label = NA)

