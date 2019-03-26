## ----env, echo = FALSE---------------------------------------------------
suppressPackageStartupMessages(library("BiocStyle"))
suppressPackageStartupMessages(library("Biostrings"))
suppressPackageStartupMessages(library("MSnbase"))

## ----pxdata--------------------------------------------------------------
library("rpx")
id <- "PXD000001"
px <- PXDataset(id)
px

## ----pxid----------------------------------------------------------------
pxid(px)

## ----purl----------------------------------------------------------------
pxurl(px)

## ----pxtax---------------------------------------------------------------
pxtax(px)

## ----pxref---------------------------------------------------------------
strwrap(pxref(px))

## ----pxfiles-------------------------------------------------------------
pxfiles(px)

## ----pxget---------------------------------------------------------------
pxget(px, "erwinia_carotovora.fasta")
dir(pattern = "fasta")

## ----pxget2--------------------------------------------------------------
(i <- grep("fasta", pxfiles(px)))
pxget(px, i) ## same as above

## ----pxan----------------------------------------------------------------
pxannounced()

## ----more, warning=FALSE-------------------------------------------------
(mzt <- grep("F0.+mztab", pxfiles(px), value = TRUE))
(fas <- grep("fasta", pxfiles(px), value = TRUE))
pxget(px, c(mzt, fas))

library("Biostrings")
readAAStringSet(fas)

library("MSnbase")
(x <- readMzTabData(mzt, "PEP", version = "0.9"))
head(exprs(x))
head(fData(x)[, 1:2])

## ----si------------------------------------------------------------------
sessionInfo()

## ----clean, echo = FALSE-------------------------------------------------
unlink("erwinia_carotovora.fasta")
unlink("F063721.dat-mztab.txt")

