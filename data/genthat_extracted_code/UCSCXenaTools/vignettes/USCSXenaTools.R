## ----setup, include = FALSE----------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ---- eval=FALSE---------------------------------------------------------
#  install.packages("UCSCXenaTools")

## ----gh-installation, eval = FALSE---------------------------------------
#  # install.packages("devtools")
#  devtools::install_github("ShixiangWang/UCSCXenaTools", build_vignettes = TRUE)

## ---- eval=FALSE---------------------------------------------------------
#  browseVignettes("UCSCXenaTools")
#  # or
#  ??UCSCXenaTools

## ------------------------------------------------------------------------
library(UCSCXenaTools)
data(XenaData)

head(XenaData)

## ------------------------------------------------------------------------
XenaGenerate()

## ------------------------------------------------------------------------
XenaGenerate(subset = XenaHostNames=="TCGA")

## ------------------------------------------------------------------------
xe = XenaGenerate(subset = XenaHostNames=="TCGA")
# get hosts
hosts(xe)
# get cohorts
head(cohorts(xe))
# get datasets
head(datasets(xe))

## ------------------------------------------------------------------------
(XenaFilter(xe, filterDatasets = "clinical") -> xe2)

## ------------------------------------------------------------------------
XenaFilter(xe2, filterDatasets = "LUAD|LUSC|LUNG") -> xe2

## ------------------------------------------------------------------------
suppressMessages(require(dplyr))

xe %>% 
    XenaFilter(filterDatasets = "clinical") %>% 
    XenaFilter(filterDatasets = "luad|lusc|lung")

## ------------------------------------------------------------------------
xe2_query = XenaQuery(xe2)
xe2_query

## ------------------------------------------------------------------------
xe2_download = XenaDownload(xe2_query)
## not run
#xe2_download = XenaDownload(xe2_query, destdir = "E:/Github/XenaData/test/")

## ------------------------------------------------------------------------
# way4: xenadownload object
cli4 = XenaPrepare(xe2_download)
names(cli4)

## ------------------------------------------------------------------------
args(getTCGAdata)

# or run
# ??getTCGAdata to read documentation

## ------------------------------------------------------------------------
getTCGAdata(c("UVM", "LUAD"))

tcga_data = getTCGAdata(c("UVM", "LUAD"))

# only return XenaHub object
tcga_data$Xena

# only return datasets information
tcga_data$DataInfo

## ------------------------------------------------------------------------
# only download clinical data
getTCGAdata(c("UVM", "LUAD"), download = TRUE)

## ---- eval=FALSE---------------------------------------------------------
#  # download RNASeq data (use UVM as an example)
#  downloadTCGA(project = "UVM",
#                   data_type = "Gene Expression RNASeq",
#                    file_type = "IlluminaHiSeq RNASeqV2")

## ------------------------------------------------------------------------
args(downloadTCGA)

## ------------------------------------------------------------------------
availTCGA()

## ---- eval=FALSE---------------------------------------------------------
#  View(showTCGA())

## ---- eval=FALSE---------------------------------------------------------
#  UCSCXenaTools::XenaShiny()

## ------------------------------------------------------------------------
sessionInfo()

