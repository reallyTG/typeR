## ----setup, include=FALSE------------------------------------------------
knitr::opts_chunk$set(echo = TRUE)
library(knitr)
read_chunk(system.file("stabs_graphs.R", package="stabs"))

required <- c("huge", "QUIC", "igraph")
if (!all(sapply(required, function(pkg) requireNamespace(pkg, quietly = TRUE))))
    knitr::opts_chunk$set(eval = FALSE)

## ---- Setup, echo=TRUE, message=FALSE, results='hide'--------------------
library(stabs)
library(huge) # Need package huge for generating test data
library(QUIC)
library(igraph)

## ---- echo=TRUE, message=FALSE, results='hide'---------------------------
N <- 200
set.seed(10010)
dat.hubs <- huge.generator(n=N, d=40, graph="hub")
set.seed(10010)
dat.cluster <- huge.generator(n=N, d=40, graph="cluster")
set.seed(10010)
dat.rand <- huge.generator(n=N, d=40, graph="random")

## ---- PlotHubs, fig.width = 8, fig.height = 8, out.width = "80%"---------
plot(dat.hubs)

## ---- PlotClust, fig.width = 8, fig.height = 8, out.width = "80%"--------
plot(dat.cluster)

## ---- PlotRand, fig.width = 8, fig.height = 8, out.width = "80%"---------
plot(dat.rand)

## ---- StabsRun-----------------------------------------------------------
s.hubs <- stabsel(x = dat.hubs$data, fitfun = quic.graphical_model, 
                  cutoff = 0.75, PFER = 10)
s.cluster <- stabsel(x = dat.cluster$data, fitfun = quic.graphical_model, 
                     cutoff = 0.75, PFER = 10)
s.rand <- stabsel(x = dat.rand$data, fitfun = quic.graphical_model, 
                  cutoff = 0.75, PFER = 10)

## ----StabsPlot-----------------------------------------------------------
plot_comparison <- function(stabsout, orig) {
    ## display comparison of original graph and stabs estimation
    j <- orig$omega * 0
    orig.graph <- graph.adjacency(orig$theta != 0, mode = "max", diag = FALSE)
    ut <- upper.tri(j)
    j[ut][stabsout$selected] <- 1
    stabs.graph <- graph.adjacency(j != 0, mode = "max", diag = FALSE)
    layout <- layout.fruchterman.reingold(orig.graph)
    
    par(mfrow = c(1,2))
    plot(orig.graph, layout = layout, edge.color = "gray50", vertex.color = 'red', 
         main = "Real graph",  vertex.size = 3, vertex.label = NA)
    plot(stabs.graph, layout = layout, edge.color = "gray50", vertex.color = 'red', 
         main = "Stabs estimated graph", vertex.size = 3, vertex.label = NA)
}

## ---- StabsPlotHubs, fig.width = 8, fig.height = 4, out.width = "80%"----
plot_comparison(s.hubs, dat.hubs)

## ---- StabsPlotCluster, fig.width = 8, fig.height = 4, out.width = "80%"----
plot_comparison(s.cluster, dat.cluster)

## ---- StabsPlotRand, fig.width = 8, fig.height = 4, out.width = "80%"----
plot_comparison(s.rand, dat.rand)

## ---- eval = FALSE-------------------------------------------------------
#  vignette("Using_stabs", package = "stabs")

## ------------------------------------------------------------------------
quic.graphical_model

## ---- eval=FALSE---------------------------------------------------------
#  class(my.graphical_model) <- c(class(my.graphical_model), "graphical_model")

