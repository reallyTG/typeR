## ---- include=FALSE------------------------------------------------------
library("knitr")
opts_chunk$set(
dev='png', fig.width=5, fig.height=5
)

## ------------------------------------------------------------------------
library("acnr")
dataSets <- listDataSets()
dataSets

## ------------------------------------------------------------------------
tf <- 1
regList <- lapply(dataSets, FUN=function(ds) {
    regDat <- loadCnRegionData(dataSet=ds, tumorFraction=tf) 
    regs <- regDat[["region"]]
})
names(regList) <- dataSets

allregs <- unique(unlist(regList))
tab <- sapply(allregs, FUN=function(reg) {
    sapply(regList, FUN=function(rr) sum(rr==reg))
})
cap <- paste("Size of annotated copy-number regions for each of the", 
            length(dataSets), "data sets.")
knitr::kable(tab, caption=cap)

## ------------------------------------------------------------------------
sessionInfo()

