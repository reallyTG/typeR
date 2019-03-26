## ----environment, echo=FALSE-----------------------------------------------
suppressPackageStartupMessages(library("MSnbase"))
suppressPackageStartupMessages(library("BiocStyle"))

## ----include_forword, echo=FALSE, results="asis"---------------------------
cat(readLines("./Foreword.md"), sep = "\n")

## ----include_bugs, echo=FALSE, results="asis"------------------------------
cat(readLines("./Bugs.md"), sep = "\n")

## ----pSet------------------------------------------------------------------
getClass("pSet")

## ----MSnExp----------------------------------------------------------------
getClass("MSnExp")

## ----OnDiskMSnExp----------------------------------------------------------
getClass("OnDiskMSnExp")

## ----MSnSet----------------------------------------------------------------
getClass("MSnSet")

## ----as--------------------------------------------------------------------
data(msnset)
class(msnset)
class(as(msnset, "ExpressionSet"))

data(sample.ExpressionSet)
class(sample.ExpressionSet)
class(as(sample.ExpressionSet, "MSnSet"))

## ----MSnProcess------------------------------------------------------------
getClass("MSnProcess")

## ----MIAPE-----------------------------------------------------------------
getClass("MIAPE")

## ----Spectrum--------------------------------------------------------------
getClass("Spectrum")

## ----Spectrum1-------------------------------------------------------------
getClass("Spectrum1")

## ----Spectrum2-------------------------------------------------------------
getClass("Spectrum2")

## ----ReporterIons----------------------------------------------------------
getClass("ReporterIons")

## ----NAnnotatedDF----------------------------------------------------------
getClass("NAnnotatedDataFrame")

## ----Chromatogram----------------------------------------------------------
getClass("Chromatogram")

## ----Chromatograms---------------------------------------------------------
getClass("Chromatograms")

## ----msl-------------------------------------------------------------------
getClass("MSnSetList")

## ----si--------------------------------------------------------------------
sessionInfo()

