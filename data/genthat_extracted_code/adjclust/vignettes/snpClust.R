## ----skipNoSNPSTATS------------------------------------------------------
# this vignette is not created if snpStats is not installed
if (!require("snpStats")) {
  knitr::opts_chunk$set(eval = FALSE)
}

## ----loadLib, message=FALSE----------------------------------------------
library("adjclust")

## ----loadData, results="hide", message=FALSE-----------------------------
library("matrixStats")
data("ld.example", package = "snpStats")

## ----preData-------------------------------------------------------------
geno <- ceph.1mb[, -316]  ## drop one SNP leading to one missing LD value
p <- ncol(geno)
nSamples <- nrow(geno)
geno

## ----LD------------------------------------------------------------------
ld.ceph <- snpStats::ld(geno, stats = "R.squared", depth = p-1)
image(ld.ceph, lwd = 0)

## ----snpClust------------------------------------------------------------
fit <- snpClust(geno, stats = "R.squared")

## ----snpClust-sparse-----------------------------------------------------
fitH <- snpClust(geno, h = 100, stats = "R.squared")
fitH

## ----dendro--------------------------------------------------------------
plot(fitH, type = "rectangle", leaflab = "perpendicular")

## ----objectDesc----------------------------------------------------------
head(cbind(fitH$merge, fitH$gains))

## ----snpClust-LD---------------------------------------------------------
h <- 100
ld.ceph <- snpStats::ld(geno, stats = "R.squared", depth = h)
image(ld.ceph, lwd = 0)

## ----correctRound--------------------------------------------------------
max(ld.ceph - 1)
ld.ceph <- round(ld.ceph, digits = 10)

## ----snpClust-sMatrix----------------------------------------------------
fitL <- snpClust(ld.ceph, h)

## ----snpClust-matrix, warning=FALSE--------------------------------------
gmat <- as(geno, "matrix")
fitM <- snpClust(geno, h, stats = "R.squared")

## ----session-------------------------------------------------------------
sessionInfo()

