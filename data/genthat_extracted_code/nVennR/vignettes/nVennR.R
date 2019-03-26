## ----setup, include = FALSE----------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>",
  dev = "svg",
  fig.show='hold', 
  fig.keep='all'
)
library(knitr)
local({
  hook_plot = knit_hooks$get('plot')
  knit_hooks$set(plot = function(x, options) {
    x = paste(x, collapse = '.')
    if (!grepl('\\.svg', x)) return(hook_plot(x, options))
    # read the content of the svg image and write it out without <?xml ... ?>
    paste(readLines(x)[-1], collapse = '\n')
  })
})

## ----"plotVenn"----------------------------------------------------------
library(nVennR)
exampledf
sas <- subset(exampledf, SAS == "Y")$Employee
python <- subset(exampledf, Python == "Y")$Employee
rr <- subset(exampledf, R == "Y")$Employee
myV <- plotVenn(list(SAS=sas, PYTHON=python, R=rr), nCycles = 2000)


## ----"Iterative"---------------------------------------------------------
myV2 <- plotVenn(list(SAS=sas, PYTHON=python, R=rr, c("A006", "A008", "A011", "Unk"), c("A011", "Unk", "A101", "A006", "A000"), c("A101", "A006", "A008")))
myV2 <- plotVenn(nVennObj = myV2)


## ----"Low-level", fig.keep='last'----------------------------------------
myV3 <- createVennObj(nSets = 5, sSizes = c(rep(1, 32)))
myV3 <- plotVenn(nVennObj = myV3)
myV3 <- plotVenn(nVennObj = myV3)

## ----"setVennRegion"-----------------------------------------------------
myV3 <- setVennRegion(myV3, region = c("Group1", "Group3", "Group4"), value = 4) # region equivalent to c(1, 0, 1, 1, 0)
myV3 <- setVennRegion(myV3, region = c(0, 1, 0, 0, 1), value = 8) # region equivalent to c("Group2", "Group5")
myV3 <- plotVenn(nVennObj = myV3, nCycles = 3000)

## ----"opacity"-----------------------------------------------------------
showSVG(nVennObj = myV3, opacity = 0.1, borderWidth = 3)

## ----"setColors"---------------------------------------------------------
showSVG(nVennObj = myV3, setColors = c('#d7100b', 'teal', 'yellow', 'black', '#2b55b7'))

## ----"showLabels"--------------------------------------------------------
showSVG(nVennObj = myV3, opacity = 0.1, labelRegions = F, fontScale = 3) # Avoid overlaps by hiding region labels

## ----"directPlot"--------------------------------------------------------
myV4 <- plotVenn(list(a=c(1, 2, 3), b=c(3, 4, 5), c=c(3, 6, 1)), nCycles = 2000, setColors=c('red', 'green', 'blue'), labelRegions=F, fontScale=2, opacity=0.2, borderWidth=2)

## ----"getVennRegion"-----------------------------------------------------
getVennRegion(myV, c("R", "SAS"))
getVennRegion(myV, c(1, 1, 1))

## ----"listVennRegions"---------------------------------------------------

listVennRegions(myV4)
listVennRegions(myV4, na.rm = F)

