## ----setup, echo = FALSE---------------------------------------------------
library(BiocStyle)
knitr::opts_chunk$set(tidy = FALSE, cache = TRUE, autodep = TRUE)

## ----samples---------------------------------------------------------------
dataFilesDir = system.file("extdata", package = "pasilla", mustWork=TRUE)
pasillaSampleAnno = read.csv(file.path(dataFilesDir, "pasilla_sample_annotation.csv"))
pasillaSampleAnno

## ----dirextData------------------------------------------------------------
dir(system.file("extdata", package = "pasilla", mustWork=TRUE), pattern = ".txt$")

## ----ecs-------------------------------------------------------------------
gffFile = file.path(dataFilesDir, "Dmel.BDGP5.25.62.DEXSeq.chr.gff")

## ----read, message = FALSE, warning = FALSE--------------------------------
library("DEXSeq")
dxd = DEXSeqDataSetFromHTSeq(
  countfiles = file.path(dataFilesDir, paste(pasillaSampleAnno$file, "txt", sep=".")), 
  sampleData = pasillaSampleAnno,
  design= ~ sample + exon + condition:exon,
  flattenedfile = gffFile)
dxd 

## ----dxd-------------------------------------------------------------------
genesforsubset = readLines(file.path(dataFilesDir, "geneIDsinsubset.txt"))
dxd = dxd[geneIDs( dxd ) %in% genesforsubset,]

## ----save, eval = FALSE----------------------------------------------------
#  save(dxd, file = file.path("..", "data", "pasillaDEXSeqDataSet.RData"))

## ----sessionInfo-----------------------------------------------------------
sessionInfo()

