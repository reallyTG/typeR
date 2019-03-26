## ----set-options,echo=FALSE---------------------------------------------------
options(width=80)
knitr::opts_chunk$set(fig.align = 'center', out.width = '70%')

## ---- warning = FALSE---------------------------------------------------------
library(bigMap)

## ---- eval = TRUE, echo = FALSE, results = 'hide'-----------------------------
bdm.local('cluster-ceab.ceab.csic.es')
bdm.mybdm('~/myPath/')

## -----------------------------------------------------------------------------
bdm.example()

## ---- echo = FALSE------------------------------------------------------------
dMap.copy <- exMap$dMap
exMap$dMap <- NULL

## -----------------------------------------------------------------------------
str(exMap)

## -----------------------------------------------------------------------------
X <- exMap$data     # let's assume this is our raw data matrix
dim(X)

## -----------------------------------------------------------------------------
myMap <- bdm.init('myDataset', X)
str(myMap)

## ---- eval = FALSE------------------------------------------------------------
#  myDistMap <- bdm.init('myDataset', X, is.distance = TRUE)     # don't run

## -----------------------------------------------------------------------------
L <- exMap$lbls     # assume this is our vector of labels

## -----------------------------------------------------------------------------
myMap <- bdm.init('myDataset', X, labels = L)
str(myMap)

## ---- echo = FALSE------------------------------------------------------------
myMap$Xdata <- exMap$Xdata
myMap$Xbeta <- exMap$Xbeta
myMap$ptsne  <- exMap$ptsne

## ---- eval = FALSE------------------------------------------------------------
#  myMap <- bdm.ptsne(myMap, threads = 8, layers = 2, rounds = 2, ppx = 200)

## -----------------------------------------------------------------------------
str(myMap$ptsne)

## -----------------------------------------------------------------------------
bdm.plot(myMap)

## -----------------------------------------------------------------------------
bdm.cost(myMap)

## ---- echo = FALSE------------------------------------------------------------
myMap$pakde  <- exMap$pakde
myMap$pakde[[2]] <- NULL

## ---- eval = FALSE------------------------------------------------------------
#  myMap <- bdm.pakde(myMap, threads = 4, ppx = 200, g.exp = 2)

## -----------------------------------------------------------------------------
str(myMap$pakde)

## ---- fig.height = 4.0--------------------------------------------------------
bdm.plot(myMap) # by default, bdm.plot() shows the output of the last step,

## ---- echo = FALSE------------------------------------------------------------
myMap$wtt  <- exMap$wtt
myMap$wtt[[2]] <- NULL

## ---- eval = FALSE------------------------------------------------------------
#  myMap <- bdm.wtt(myMap)

## -----------------------------------------------------------------------------
str(myMap$wtt)

## -----------------------------------------------------------------------------
bdm.plot(myMap)

## -----------------------------------------------------------------------------
myDataLabels <- bdm.labels(myMap)

## ---- eval = FALSE------------------------------------------------------------
#  myDataLabels2 <- bdm.labels(myMap, layer = 2)

## ---- out.width = '70%'-------------------------------------------------------
bdm.cost(myMap, offset = 100)

## ---- fig.height = 4.0--------------------------------------------------------
bdm.plot(myMap, ptsne = TRUE, ptsne.cex = 0.6, ptsne.pltt = rainbow(16), layer = 2)

## ---- tidy = FALSE------------------------------------------------------------
mypalette <- colorspace::heat_hcl(12, h = c(300, 75), c. = c(35, 95), l = c(15, 90),
    power = c(0.8, + 1.2), fixup = TRUE, gamma = NULL, alpha = 1)[3:12]

## ---- fig.height = 4.0--------------------------------------------------------
bdm.plot(myMap, pakde.pltt = mypalette, pakde.lvls = 10, plot.peaks = FALSE)

## ---- fig.height = 5.5--------------------------------------------------------
bdm.qMap(myMap, data = myMap$data[, 2:4], subset = which(myMap$lbls %in% 1:8))

## -----------------------------------------------------------------------------
# assume these are our class covariates
myclasses <- c('A', 'B', 'C', 'D', 'E')[(myMap$lbls %/% 4) +1]

## ---- echo = FALSE------------------------------------------------------------
myMap$dMap <- dMap.copy

## ---- eval = FALSE------------------------------------------------------------
#  myMap <- bdm.dMap(myMap, threads = 4, labels = myclasses)

## ---- fig.height = 5.5--------------------------------------------------------
bdm.dMap.plot(myMap, classes = c('B', 'D', 'E'))

## ---- fig.height = 5.5--------------------------------------------------------
bdm.boxp(myMap)

## -----------------------------------------------------------------------------
bdm.mybdm('~/myPath/')

## -----------------------------------------------------------------------------
bdm.fName(myMap)

## ---- eval = FALSE------------------------------------------------------------
#  bdm.save(myMap)

## -----------------------------------------------------------------------------
bdm.local('xxx.xxx.xxx.xxx')

## ---- eval = FALSE------------------------------------------------------------
#  bdm.scp(myMap)

