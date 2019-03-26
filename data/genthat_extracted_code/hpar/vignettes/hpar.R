## ----env, echo=FALSE-------------------------------------------------------
suppressPackageStartupMessages(library("BiocStyle"))
suppressPackageStartupMessages(library("org.Hs.eg.db"))
suppressPackageStartupMessages(library("GO.db"))

## ----install, eval = FALSE-------------------------------------------------
#  ## install BiocManager only one
#  install.packages("BiocManager")
#  ## install hpar
#  BiocManager::install("hpar")

## ----load------------------------------------------------------------------
library("hpar")

## ----hpaData---------------------------------------------------------------
data(hpaNormalTissue)
dim(hpaNormalTissue)
names(hpaNormalTissue)
## Number of genes
length(unique(hpaNormalTissue$Gene))
## Number of cell types
length(unique(hpaNormalTissue$Cell.type))
head(levels(hpaNormalTissue$Cell.type))
## Number of tissues
length(unique(hpaNormalTissue$Tissue))
head(levels(hpaNormalTissue$Tissue))

## ----getHpa----------------------------------------------------------------
id <- "ENSG00000000003"
head(getHpa(id, hpadata = "hpaNormalTissue"))
getHpa(id, hpadata = "hpaSubcellularLoc")
head(getHpa(id, hpadata = "rnaGeneCellLine"))

## ----getHpa2, eval=FALSE---------------------------------------------------
#  getHpa(id, type = "details")

## ----opts------------------------------------------------------------------
getHparOptions()
setHparOptions(hpadata = "hpaSubcellularLoc")
getHparOptions()
getHpa(id)

## ----rel-------------------------------------------------------------------
getHpaVersion()
getHpaDate()
getHpaEnsembl()

## ----uc-hpar---------------------------------------------------------------
id <- "ENSG00000001460"
getHpa(id, "hpaSubcellularLoc")

## ----uc-db-----------------------------------------------------------------
library("org.Hs.eg.db")
library("GO.db")
ans <- select(org.Hs.eg.db, keys = id,
			  columns = c("ENSEMBL", "GO", "ONTOLOGY"),
			  keytype = "ENSEMBL")
ans <- ans[ans$ONTOLOGY == "CC", ]
ans
sapply(as.list(GOTERM[ans$GO]), slot, "Term")

## ----sessioninfo, echo = FALSE---------------------------------------------
sessionInfo()

