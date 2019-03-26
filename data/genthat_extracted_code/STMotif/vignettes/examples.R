## ----setup, include = FALSE----------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ---- echo=FALSE---------------------------------------------------------
source(file = "../R/mainFunction.R")
source(file = "../R/subFunction.R")
source(file = "../R/visualization.R")
library(stats)
library(ggplot2)
library(reshape2)
library(RColorBrewer)

## ---- echo=TRUE----------------------------------------------------------

# The process is launched on the provided example dataset
dim(D <- STMotif::example_dataset)


# Normalizartion and SAX indexing
DS <- NormSAX(D = STMotif::example_dataset,a =7)

# Information of the normalized and SAX indexing dataset 
# The candidates built 
head(NormSAX(D = STMotif::example_dataset, a = 7)[,1:10])


## ---- echo=TRUE----------------------------------------------------------
# The list of motifs 
# stmotifs <- SearchSTMotifs(D,DS,w,a,sb,tb,si,ka)
head(stmotifs <- SearchSTMotifs(D,DS,3,7,10,10,3,10))

## ---- echo=TRUE----------------------------------------------------------
# The rank list of stmotifs 
# rstmotifs <- RankSTMotifs(stmotifs)
head(rstmotifs <- RankSTMotifs(stmotifs))

## ----fig, fig.height = 4, fig.width = 6, fig.align = "center"------------
# Plot the intensity of the dataset and highlight the motifs from the rankList
intensityDataset(dataset = D,rankList = rstmotifs,alpha = 7)

## ----fig1, fig.height = 4, fig.width = 6, fig.align = "center"-----------
# Plot five specific spatial-series which some of them contain the best motif
displayPlotSeries(dataset = D, rmotifs = rstmotifs ,position = 1 ,space = c(1,2,5:7))

