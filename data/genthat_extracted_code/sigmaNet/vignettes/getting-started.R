## ----setup, include = FALSE----------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ------------------------------------------------------------------------
library(sigmaNet)
library(igraph)
library(magrittr)

data(lesMis)
class(lesMis)

## ------------------------------------------------------------------------
list.vertex.attributes(lesMis)

## ------------------------------------------------------------------------
list.edge.attributes(lesMis)

## ------------------------------------------------------------------------
sig <- sigmaFromIgraph(lesMis)

## ------------------------------------------------------------------------
l <- layout_nicely(lesMis)
sig <- sigmaFromIgraph(lesMis, l)

## ------------------------------------------------------------------------
sig

## ------------------------------------------------------------------------
sig %>%
  addNodeSize(sizeMetric = 'degree', maxSize = 8)

## ------------------------------------------------------------------------
sig %>%
  addNodeSize(sizeMetric = 'degree', maxSize = 8) %>%
  addNodeLabels(labelAttr = 'label')

## ------------------------------------------------------------------------
clust <- cluster_edge_betweenness(lesMis)$membership
V(lesMis)$group <- clust

sig <- sigmaFromIgraph(lesMis)

sig %>%
  addNodeSize(sizeMetric = 'degree', maxSize = 8) %>%
  addNodeLabels(labelAttr = 'label') %>%
  addNodeColors(colorAttr = 'group')

## ------------------------------------------------------------------------
sig %>%
  addNodeSize(sizeMetric = 'degree', maxSize = 8) %>%
  addNodeLabels(labelAttr = 'label') %>%
  addNodeColors(colorAttr = 'group') %>%
  addEdgeSize(sizeAttr = 'value', minSize = .1, maxSize = 2)

## ------------------------------------------------------------------------
sig %>%
  addNodeSize(sizeMetric = 'degree', maxSize = 8) %>%
  addNodeLabels(labelAttr = 'label') %>%
  addNodeColors(colorAttr = 'group') %>%
  addEdgeSize(sizeAttr = 'value', minSize = .1, maxSize = 2) %>%
  addEdgeColors(oneColor = '#3182bd')

## ------------------------------------------------------------------------
sig %>%
  addNodeSize(sizeMetric = 'degree', maxSize = 8) %>%
  addNodeLabels(labelAttr = 'label') %>%
  addNodeColors(colorAttr = 'group') %>%
  addEdgeSize(sizeAttr = 'value', minSize = .1, maxSize = 2) %>%
  addEdgeColors(oneColor = '#3182bd') %>%
  addInteraction(neighborEvent = 'None')

## ---- eval = FALSE-------------------------------------------------------
#  sig %>%
#    addNodeSize(sizeMetric = 'degree', maxSize = 8) %>%
#    addNodeLabels(labelAttr = 'label') %>%
#    addNodeColors(colorAttr = 'group') %>%
#    addEdgeSize(sizeAttr = 'value', minSize = .1, maxSize = 2) %>%
#    addEdgeColors(oneColor = '#3182bd') %>%
#    addInteraction(neighborEvent = 'None') %>%
#    saveSigma('mySigmaGraph.html')

