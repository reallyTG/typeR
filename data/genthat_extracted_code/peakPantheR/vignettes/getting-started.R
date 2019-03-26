## ---- echo = FALSE-------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ---- echo = FALSE, include = FALSE--------------------------------------
if (getRversion() >= "3.6") {
  knitr::opts_chunk$set(eval = FALSE)
}
required <- c("faahKO")
if (!all(unlist(lapply(required, function(pkg) requireNamespace(pkg, quietly = TRUE))))) {
  knitr::opts_chunk$set(eval = FALSE)
}

## ---- eval = FALSE-------------------------------------------------------
#  # Install devtools
#  if(!require("devtools")) install.packages("devtools")
#  devtools::install_github("phenomecentre/peakPantheR")

## ---- eval = FALSE-------------------------------------------------------
#  setRepositories(ind=1:2)

## ---- eval = FALSE-------------------------------------------------------
#  setRepositories(ind=1:4)
#  install.packages('faahKO')

## ---- echo = FALSE, include = FALSE--------------------------------------
# hide package load message
library(faahKO)

## ------------------------------------------------------------------------
library(faahKO)
## file paths
input_spectraPaths  <- c(system.file('cdf/KO/ko15.CDF', package = "faahKO"),
                         system.file('cdf/KO/ko16.CDF', package = "faahKO"),
                         system.file('cdf/KO/ko18.CDF', package = "faahKO"))

## ---- echo = FALSE-------------------------------------------------------
library(faahKO)
input_spectraPaths  <- c(system.file('cdf/KO/ko15.CDF', package = "faahKO"),
                         system.file('cdf/KO/ko16.CDF', package = "faahKO"),
                         system.file('cdf/KO/ko18.CDF', package = "faahKO"))
input_spectraPaths

## ---- eval = FALSE-------------------------------------------------------
#  # targetFeatTable
#  input_targetFeatTable     <- data.frame(matrix(vector(), 2, 8, dimnames=list(c(), c("cpdID", "cpdName", "rtMin", "rt", "rtMax", "mzMin", "mz", "mzMax"))), stringsAsFactors=F)
#  input_targetFeatTable[1,] <- c(1, "Cpd 1", 3310., 3344.888, 3390., 522.194778, 522.2, 522.205222)
#  input_targetFeatTable[2,] <- c(2, "Cpd 2", 3280., 3385.577, 3440., 496.195038, 496.2, 496.204962)
#  input_targetFeatTable[,c(1,3:8)] <- sapply(input_targetFeatTable[,c(1,3:8)], as.numeric)

## ---- results = "asis", echo = FALSE-------------------------------------
input_targetFeatTable     <- data.frame(matrix(vector(), 2, 8, dimnames=list(c(), c("cpdID", "cpdName", "rtMin", "rt", "rtMax", "mzMin", "mz", "mzMax"))), stringsAsFactors=F)
input_targetFeatTable[1,] <- c(1, "Cpd 1", 3310., 3344.888, 3390., 522.194778, 522.2, 522.205222)
input_targetFeatTable[2,] <- c(2, "Cpd 2", 3280., 3385.577, 3440., 496.195038, 496.2, 496.204962)
input_targetFeatTable[,c(1,3:8)] <- sapply(input_targetFeatTable[,c(1,3:8)], as.numeric)
rownames(input_targetFeatTable) <- NULL
pander::pandoc.table(input_targetFeatTable, digits = 9)

