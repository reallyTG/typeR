## ----env, echo=FALSE-------------------------------------------------------
suppressPackageStartupMessages(library("BiocStyle"))
suppressPackageStartupMessages(library("MSnbase"))
suppressPackageStartupMessages(library("pRolocdata"))

## ----include_forword, echo=FALSE, results="asis"---------------------------
cat(readLines("./Foreword.md"), sep = "\n")

## ----include_bugs, echo=FALSE, results="asis"------------------------------
cat(readLines("./Bugs.md"), sep = "\n")

## ----readCsvData0----------------------------------------------------------
## The original data for replicate 1, available
## from the pRolocdata package
f0 <- dir(system.file("extdata", package = "pRolocdata"), 
          full.names = TRUE, 
          pattern = "pr800866n_si_004-rep1.csv")
csv <- read.csv(f0)

## ----showOrgCsv------------------------------------------------------------
head(csv, n=3)

## ----readCsvData1----------------------------------------------------------
## The quantitation data, from the original data
f1 <- dir(system.file("extdata", package = "pRolocdata"), 
          full.names = TRUE, pattern = "exprsFile.csv")
exprsCsv <- read.csv(f1)
## Feature meta-data, from the original data
f2 <- dir(system.file("extdata", package = "pRolocdata"), 
          full.names = TRUE, pattern = "fdataFile.csv")
fdataCsv <- read.csv(f2)
## Sample meta-data, a new file
f3 <- dir(system.file("extdata", package = "pRolocdata"), 
          full.names = TRUE, pattern = "pdataFile.csv")
pdataCsv <- read.csv(f3)

## ----showExprsFile---------------------------------------------------------
head(exprsCsv, n = 3)

## ----showFdFile------------------------------------------------------------
head(fdataCsv, n = 3)

## ----showPdFile------------------------------------------------------------
pdataCsv

## ----makeMSnSet------------------------------------------------------------
library("MSnbase")
res <- readMSnSet(exprsFile = f1,
                  featureDataFile = f2,
                  phenoDataFile = f3,
                  sep = ",")
res

## ----readMSnSet2-----------------------------------------------------------
ecol <- paste("area", 114:117, sep = ".")
fname <- "Protein.ID"
eset <- readMSnSet2(f0, ecol, fname)
eset

## ----ecols-----------------------------------------------------------------
getEcols(f0, ",")
grepEcols(f0, "area", ",")
e <- grepEcols(f0, "area", ",")
readMSnSet2(f0, e)

## --------------------------------------------------------------------------
sessionInfo()

