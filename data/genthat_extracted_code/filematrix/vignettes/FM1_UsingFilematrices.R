## ----setup, echo=FALSE---------------------------------------------------
# setwd("D:/")
library(knitr)
# opts_knit$set(root.dir=tempdir())

## ----message=FALSE-------------------------------------------------------
library(filematrix)
fm = fm.create(filenamebase = "fmat", nrow = 200, ncol = 200, type = "double")

## ----comment=""----------------------------------------------------------
cat(readLines("fmat.desc.txt"), sep = "\n")

## ------------------------------------------------------------------------
fm[1:3, 1:2] = 1:6
fm[1:4, 1:3]
colSums(fm[,1:4])

## ------------------------------------------------------------------------
fm[1:4]
fm[nrow(fm)+1:4]

## ------------------------------------------------------------------------
colnames(fm) = paste0("Col", 1:ncol(fm))
rownames(fm) = paste0("Row", 1:nrow(fm))

## ------------------------------------------------------------------------
close(fm)

## ------------------------------------------------------------------------
fm = fm.open(filenamebase = "fmat", readonly = FALSE)

## ------------------------------------------------------------------------
mat = fm.load("fmat")

## ------------------------------------------------------------------------
matrix(1:12, nrow = 3, ncol = 4)

## ----row-col-timing------------------------------------------------------
timerow = system.time( { sum(fm[1:10, ]) } )[3]
timecol = system.time( { sum(fm[ ,1:10]) } )[3]
cat("Reading ", nrow(fm)*10, " values from 10 columns takes ", timecol, " seconds", "\n",
    "Reading ", ncol(fm)*10, " values from 10 rows takes ",    timerow, " seconds", "\n", sep = "")

## ------------------------------------------------------------------------
dim(fm)
fm$appendColumns(nrow(fm):1)
fm$appendColumns(1:nrow(fm))
dim(fm)
fm[nrow(fm)+(-1:0), ncol(fm)+(-1:0)]


## ------------------------------------------------------------------------
closeAndDeleteFiles(fm)

## ----version-------------------------------------------------------------
sessionInfo()

