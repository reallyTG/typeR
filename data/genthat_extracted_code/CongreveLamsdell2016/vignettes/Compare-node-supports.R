## ----initialize, echo=FALSE, message=FALSE-------------------------------
library("Quartet")
library("Ternary")
library("CongreveLamsdell2016")

data('clBremPartitions', 'clBremQuartets', 'clMkvPartitions', 'clMkvQuartets',
     'clBootFreqPartitions', 'clBootFreqQuartets', 
     'clBootGcPartitions', 'clBootGcQuartets',
     'clJackFreqPartitions', 'clJackFreqQuartets',
     'clJackGcPartitions', 'clJackGcQuartets', 
     'clCI')

## ----initialize-variables, echo=FALSE------------------------------------
PCH_MK <- 1   # circle
PCH_EQ <- 61  #'='
PCH_XX <- 18 # 183 #'.' is invalid in some locales
PCH_IW <- 2   #triup
PCH_IC <- 17  #triupfilled
TREE <- 2

COL <- c(
  'mk' = paste0(cbPalette8[4],  '99'),
  'eq' = paste0(cbPalette8[8],  '99'),
  'k1' = paste0(cbPalette8[6],  '42'),
  'k2' = paste0(cbPalette8[6],  '42'),
  'k3' = paste0(cbPalette8[6],  '42'),
  'k5' = paste0(cbPalette8[6],  '42'),
  'kX' = paste0(cbPalette8[6],  '99'),
  'kC' = paste0(cbPalette8[2],  '99'))

PCH <- c(
  brem = 2,
  bootG = 0,
  bootF = 5,
  jackG = 3,
  jackF = 4,
  mk = 1
  
)

MARGINS <- c(2.8, 0.3, 0.3, 0.3)
ROWS <- c(2, 3)

TernaryQuarts <- function(TREE=TREE, an='eq', zoom=1, padding=0.1) {
  
  clInitializeTernaryQuarts(zoom=zoom, padding=padding)
  
  clPlotQuartets(pch=PCH['brem'] , cex=2, clBremQuartets[an], TREE)
  clPlotQuartets(pch=PCH['bootF'], cex=2, clBootFreqQuartets[an], TREE)
  clPlotQuartets(pch=PCH['bootG'], cex=2, clBootGcQuartets[an], TREE)
  clPlotQuartets(pch=PCH['jackF'], cex=2, clJackFreqQuartets[an], TREE)
  clPlotQuartets(pch=PCH['jackG'], cex=2, clJackGcQuartets[an], TREE)
  
  clPlotQuartets(pch=PCH['mk'], clMkvQuartets, TREE, cex=2, col=COL['mk'])
  
  # Return:
  invisible()
}

TernaryAllQuarts <- function(an='eq', zoom=1, padding=0.1) {
  
  clInitializeTernaryQuarts(zoom=zoom, padding=padding)
  
  clPlotTheseAverageQuartets(pch=PCH['brem'] , cex=2, col=COL[an],
                             clBremQuartets[[an]])
  clPlotTheseAverageQuartets(pch=PCH['bootF'], cex=2, col=COL[an],
                             clBootFreqQuartets[[an]])
  clPlotTheseAverageQuartets(pch=PCH['bootG'], cex=2, col=COL[an],
                             clBootGcQuartets[[an]])
  clPlotTheseAverageQuartets(pch=PCH['jackF'], cex=2, col=COL[an],
                             clJackFreqQuartets[[an]])
  clPlotTheseAverageQuartets(pch=PCH['jackG'], cex=2, col=COL[an],
                             clJackGcQuartets[[an]])
  
  clPlotTheseAverageQuartets(pch=PCH['mk'], clMkvQuartets, cex=2, col=COL['mk'])
  
  # Return:
  invisible()
}


TernaryParts<-function(TREE=TREE, an='eq') {
  
  clInitializeTernarySplits()
  title(main="\nPartitions", cex.main=0.8)
  
  HorizontalGrid(19)
  
  clPlotSplits(pch=PCH['brem'] , cex=2, col=COL[an], clBremPartitions[[an]], TREE)
  clPlotSplits(pch=PCH['bootF'], cex=2, col=COL[an], clBootGcPartitions[[an]], TREE)
  clPlotSplits(pch=PCH['bootG'], cex=2, col=COL[an], clBootFreqPartitions[[an]], TREE)
  clPlotSplits(pch=PCH['jackF'], cex=2, col=COL[an], clJackGcPartitions[[an]], TREE)
  clPlotSplits(pch=PCH['jackG'], cex=2, col=COL[an], clJackFreqPartitions[[an]], TREE)
  
  clPlotSplits(pch=PCH['mk'], cex=2, clMkvPartitions, TREE, col=COL['mk'])
  
  # Return:
  invisible()
}

TernaryAllParts<-function(an='eq') {
  
  clInitializeTernarySplits()
  title(main="\nPartitions", cex.main=0.8)
  
  HorizontalGrid(19)
  
  clPlotTheseAverageSplits(pch=PCH['brem'] , col=COL[an], cex=2,
                           clBremPartitions[[an]])
  clPlotTheseAverageSplits(pch=PCH['bootF'], col=COL[an], cex=2,
                           clBootGcPartitions[[an]])
  clPlotTheseAverageSplits(pch=PCH['bootG'], col=COL[an], cex=2,
                           clBootFreqPartitions[[an]])
  clPlotTheseAverageSplits(pch=PCH['jackF'], col=COL[an], cex=2,
                           clJackGcPartitions[[an]])
  clPlotTheseAverageSplits(pch=PCH['jackG'], col=COL[an], cex=2,
                           clJackFreqPartitions[[an]])
  
  clPlotTheseAverageSplits(pch=PCH['mk'], cex=2, clMkvPartitions, col=COL['mk'])
  
  # Return:
  invisible()
}

AddLegend <- function(pos='bottomright', an='eq') {
  legend(pos, cex=0.8, bty='n',
         lty=1,
         pch=PCH[c('mk', 'brem', 'bootF', 'bootG', 'jackF', 'jackG')], pt.cex=1.2,
         col=c(COL['mk'], rep(COL[an], 5)),
         legend=c('Markov', 'Bremer', 'BootFreq', 'Boot GC', 'Jack Freq', 'Jack GC')
   )
}

CompareNodeSupports <- function (i) { 
  x <- Sys.setlocale("LC_ALL", "C") # allows PCH=183
  
  TernaryQuarts(TREE=i, an='eq')
  title(main=paste0("\nQuartets"), cex.main=0.8)
  arrows(sqrt(3/4) * 0.5, 0.5, sqrt(3/4) * 0.8, 0.5, length=0.1)
  text  (sqrt(3/4) * 0.65, 0.5, pos=3, 'Decreasing resolution', cex=0.8)
  
  arrows(sqrt(3/4) * 0.98, 0.40, sqrt(3/4) * 0.98, 0.20, length=0.1)
  text  (sqrt(3/4) * 1.01, 0.30, pos=3, 'Increasing divergence', cex=0.8, srt=270)
  
  TernaryQuarts(TREE=i, an='eq', zoom=3, padding=0.01)
  title(main=paste0("\nDataset ", i, ": CI=",round(clCI[i], 2), ". Equal weights"), cex.main=1.2)
  
  TernaryParts(TREE=i, an='eq')
  
  arrows(sqrt(3/4) * 0.98, 0.40, sqrt(3/4) * 0.98, 0.20, length=0.1)
  text  (sqrt(3/4) * 1.01, 0.30, pos=3, 'Increasing RF distance', cex=0.8, srt=270)
  
  AddLegend(an='eq')
  
  TernaryQuarts(TREE=i, an='k3')
  title(main=paste0("\nQuartets"), cex.main=0.8)
  arrows(sqrt(3/4) * 0.5, 0.5, sqrt(3/4) * 0.8, 0.5, length=0.1)
  text  (sqrt(3/4) * 0.65, 0.5, pos=3, 'Decreasing resolution', cex=0.8)
  
  arrows(sqrt(3/4) * 0.98, 0.40, sqrt(3/4) * 0.98, 0.20, length=0.1)
  text  (sqrt(3/4) * 1.01, 0.30, pos=3, 'Increasing divergence', cex=0.8, srt=270)
  
  TernaryQuarts(TREE=i, an='k3', zoom=3, padding=0.01)
  title(main="\nImplied weights (k = 3)", cex.main=1.2)
  TernaryParts(TREE=i, an='k3')
  
  arrows(sqrt(3/4) * 0.98, 0.40, sqrt(3/4) * 0.98, 0.20, length=0.1)
  text  (sqrt(3/4) * 1.01, 0.30, pos=3, 'Increasing RF distance', cex=0.8, srt=270)
  
  AddLegend(an='k3')
}

## ----Averages, echo=FALSE, fig.width=9, fig.height=6---------------------
par(mfrow=c(2, ROWS[2]), mar=MARGINS)
TernaryAllQuarts(an='eq')
title(main=paste0("\nQuartets"), cex.main=0.8)
arrows(sqrt(3/4) * 0.5, 0.5, sqrt(3/4) * 0.8, 0.5, length=0.1)
text  (sqrt(3/4) * 0.65, 0.5, pos=3, 'Decreasing resolution', cex=0.8)

arrows(sqrt(3/4) * 0.98, 0.40, sqrt(3/4) * 0.98, 0.20, length=0.1)
text  (sqrt(3/4) * 1.01, 0.30, pos=3, 'Increasing divergence', cex=0.8, srt=270)

TernaryAllQuarts(an='eq', zoom=3, padding=0.01)
title(main="\nAll datasets (averaged). Equal weights.", cex.main=1.2)

TernaryAllParts(an='eq')

arrows(sqrt(3/4) * 0.98, 0.40, sqrt(3/4) * 0.98, 0.20, length=0.1)
text  (sqrt(3/4) * 1.01, 0.30, pos=3, 'Increasing RF distance', cex=0.8, srt=270)

AddLegend(an='eq')

TernaryAllQuarts(an='k3')
title(main=paste0("\nQuartets"), cex.main=0.8)
arrows(sqrt(3/4) * 0.5, 0.5, sqrt(3/4) * 0.8, 0.5, length=0.1)
text  (sqrt(3/4) * 0.65, 0.5, pos=3, 'Decreasing resolution', cex=0.8)

arrows(sqrt(3/4) * 0.98, 0.40, sqrt(3/4) * 0.98, 0.20, length=0.1)
text  (sqrt(3/4) * 1.01, 0.30, pos=3, 'Increasing divergence', cex=0.8, srt=270)

TernaryAllQuarts(an='k3', zoom=3, padding=0.01)

title(main="\nImplied weights (k = 3)", cex.main=1.2)
TernaryAllParts(an='k3')

arrows(sqrt(3/4) * 0.98, 0.40, sqrt(3/4) * 0.98, 0.20, length=0.1)
text  (sqrt(3/4) * 1.01, 0.30, pos=3, 'Increasing RF distance', cex=0.8, srt=270)

AddLegend(an='k3')

## ----compare-best, results='asis', echo=FALSE----------------------------
TreeBests <- function (dataset) vapply(dataset, function (item) 
  apply(apply(item, 1, function (x)
    QuartetDivergence(t(x))), 1, max), double(dim(dataset[[1]])[3]))

treeBests <- vapply(list(clBootGcQuartets, clBootFreqQuartets,
                         clJackGcQuartets, clJackFreqQuartets, clBremQuartets),
                    TreeBests, 
                    matrix(0, nrow=dim(clBootGcQuartets[[1]])[3],
                           ncol=length(clBootGcQuartets))
                    )



tests <- apply(treeBests, 2, function (slice)
  apply(slice, 2, function (column) t.test(column, slice[, 1])$p.value))

rownames(tests) <- c( 'Bootstrap GC', 'Bootstrap Freq',
                      'Jackknife GC', 'Jackknife Freq', 'Bremer')
knitr::kable(tests)


## ---- echo=FALSE, fig.width=9, fig.height=6------------------------------
par(mfrow=ROWS, mar=MARGINS); x <- CompareNodeSupports(1)

## ---- echo=FALSE, fig.width=9, fig.height=6------------------------------
par(mfrow=ROWS, mar=MARGINS); x <- CompareNodeSupports(2)

## ---- echo=FALSE, fig.width=9, fig.height=6------------------------------
par(mfrow=ROWS, mar=MARGINS); x <- CompareNodeSupports(3)

## ---- echo=FALSE, fig.width=9, fig.height=6------------------------------
par(mfrow=ROWS, mar=MARGINS); x <- CompareNodeSupports(4)

## ---- echo=FALSE, fig.width=9, fig.height=6------------------------------
par(mfrow=ROWS, mar=MARGINS); x <- CompareNodeSupports(5)

## ---- echo=FALSE, fig.width=9, fig.height=6------------------------------
par(mfrow=ROWS, mar=MARGINS); x <- CompareNodeSupports(6)

## ---- echo=FALSE, fig.width=9, fig.height=6------------------------------
par(mfrow=ROWS, mar=MARGINS); x <- CompareNodeSupports(7)

## ---- echo=FALSE, fig.width=9, fig.height=6------------------------------
par(mfrow=ROWS, mar=MARGINS); x <- CompareNodeSupports(8)

## ---- echo=FALSE, fig.width=9, fig.height=6------------------------------
par(mfrow=ROWS, mar=MARGINS); x <- CompareNodeSupports(9)

## ---- echo=FALSE, fig.width=9, fig.height=6------------------------------
par(mfrow=ROWS, mar=MARGINS); x <- CompareNodeSupports(10)

## ---- echo=FALSE, fig.width=9, fig.height=6------------------------------
par(mfrow=ROWS, mar=MARGINS); x <- CompareNodeSupports(11)

## ---- echo=FALSE, fig.width=9, fig.height=6------------------------------
par(mfrow=ROWS, mar=MARGINS); x <- CompareNodeSupports(12)

## ---- echo=FALSE, fig.width=9, fig.height=6------------------------------
par(mfrow=ROWS, mar=MARGINS); x <- CompareNodeSupports(13)

## ---- echo=FALSE, fig.width=9, fig.height=6------------------------------
par(mfrow=ROWS, mar=MARGINS); x <- CompareNodeSupports(14)

## ---- echo=FALSE, fig.width=9, fig.height=6------------------------------
par(mfrow=ROWS, mar=MARGINS); x <- CompareNodeSupports(15)

## ---- echo=FALSE, fig.width=9, fig.height=6------------------------------
par(mfrow=ROWS, mar=MARGINS); x <- CompareNodeSupports(16)

## ---- echo=FALSE, fig.width=9, fig.height=6------------------------------
par(mfrow=ROWS, mar=MARGINS); x <- CompareNodeSupports(17)

## ---- echo=FALSE, fig.width=9, fig.height=6------------------------------
par(mfrow=ROWS, mar=MARGINS); x <- CompareNodeSupports(18)

## ---- echo=FALSE, fig.width=9, fig.height=6------------------------------
par(mfrow=ROWS, mar=MARGINS); x <- CompareNodeSupports(19)

## ---- echo=FALSE, fig.width=9, fig.height=6------------------------------
par(mfrow=ROWS, mar=MARGINS); x <- CompareNodeSupports(20)

## ---- echo=FALSE, fig.width=9, fig.height=6------------------------------
par(mfrow=ROWS, mar=MARGINS); x <- CompareNodeSupports(21)

## ---- echo=FALSE, fig.width=9, fig.height=6------------------------------
par(mfrow=ROWS, mar=MARGINS); x <- CompareNodeSupports(22)

## ---- echo=FALSE, fig.width=9, fig.height=6------------------------------
par(mfrow=ROWS, mar=MARGINS); x <- CompareNodeSupports(23)

## ---- echo=FALSE, fig.width=9, fig.height=6------------------------------
par(mfrow=ROWS, mar=MARGINS); x <- CompareNodeSupports(24)

## ---- echo=FALSE, fig.width=9, fig.height=6------------------------------
par(mfrow=ROWS, mar=MARGINS); x <- CompareNodeSupports(25)

## ---- echo=FALSE, fig.width=9, fig.height=6------------------------------
par(mfrow=ROWS, mar=MARGINS); x <- CompareNodeSupports(26)

## ---- echo=FALSE, fig.width=9, fig.height=6------------------------------
par(mfrow=ROWS, mar=MARGINS); x <- CompareNodeSupports(27)

## ---- echo=FALSE, fig.width=9, fig.height=6------------------------------
par(mfrow=ROWS, mar=MARGINS); x <- CompareNodeSupports(28)

## ---- echo=FALSE, fig.width=9, fig.height=6------------------------------
par(mfrow=ROWS, mar=MARGINS); x <- CompareNodeSupports(29)

## ---- echo=FALSE, fig.width=9, fig.height=6------------------------------
par(mfrow=ROWS, mar=MARGINS); x <- CompareNodeSupports(30)

## ---- echo=FALSE, fig.width=9, fig.height=6------------------------------
par(mfrow=ROWS, mar=MARGINS); x <- CompareNodeSupports(31)

## ---- echo=FALSE, fig.width=9, fig.height=6------------------------------
par(mfrow=ROWS, mar=MARGINS); x <- CompareNodeSupports(32)

## ---- echo=FALSE, fig.width=9, fig.height=6------------------------------
par(mfrow=ROWS, mar=MARGINS); x <- CompareNodeSupports(33)

## ---- echo=FALSE, fig.width=9, fig.height=6------------------------------
par(mfrow=ROWS, mar=MARGINS); x <- CompareNodeSupports(34)

## ---- echo=FALSE, fig.width=9, fig.height=6------------------------------
par(mfrow=ROWS, mar=MARGINS); x <- CompareNodeSupports(35)

## ---- echo=FALSE, fig.width=9, fig.height=6------------------------------
par(mfrow=ROWS, mar=MARGINS); x <- CompareNodeSupports(36)

## ---- echo=FALSE, fig.width=9, fig.height=6------------------------------
par(mfrow=ROWS, mar=MARGINS); x <- CompareNodeSupports(37)

## ---- echo=FALSE, fig.width=9, fig.height=6------------------------------
par(mfrow=ROWS, mar=MARGINS); x <- CompareNodeSupports(38)

## ---- echo=FALSE, fig.width=9, fig.height=6------------------------------
par(mfrow=ROWS, mar=MARGINS); x <- CompareNodeSupports(39)

## ---- echo=FALSE, fig.width=9, fig.height=6------------------------------
par(mfrow=ROWS, mar=MARGINS); x <- CompareNodeSupports(40)

## ---- echo=FALSE, fig.width=9, fig.height=6------------------------------
par(mfrow=ROWS, mar=MARGINS); x <- CompareNodeSupports(41)

## ---- echo=FALSE, fig.width=9, fig.height=6------------------------------
par(mfrow=ROWS, mar=MARGINS); x <- CompareNodeSupports(42)

## ---- echo=FALSE, fig.width=9, fig.height=6------------------------------
par(mfrow=ROWS, mar=MARGINS); x <- CompareNodeSupports(43)

## ---- echo=FALSE, fig.width=9, fig.height=6------------------------------
par(mfrow=ROWS, mar=MARGINS); x <- CompareNodeSupports(44)

## ---- echo=FALSE, fig.width=9, fig.height=6------------------------------
par(mfrow=ROWS, mar=MARGINS); x <- CompareNodeSupports(45)

## ---- echo=FALSE, fig.width=9, fig.height=6------------------------------
par(mfrow=ROWS, mar=MARGINS); x <- CompareNodeSupports(46)

## ---- echo=FALSE, fig.width=9, fig.height=6------------------------------
par(mfrow=ROWS, mar=MARGINS); x <- CompareNodeSupports(47)

## ---- echo=FALSE, fig.width=9, fig.height=6------------------------------
par(mfrow=ROWS, mar=MARGINS); x <- CompareNodeSupports(48)

## ---- echo=FALSE, fig.width=9, fig.height=6------------------------------
par(mfrow=ROWS, mar=MARGINS); x <- CompareNodeSupports(49)

## ---- echo=FALSE, fig.width=9, fig.height=6------------------------------
par(mfrow=ROWS, mar=MARGINS); x <- CompareNodeSupports(50)

## ---- echo=FALSE, fig.width=9, fig.height=6------------------------------
par(mfrow=ROWS, mar=MARGINS); x <- CompareNodeSupports(51)

## ---- echo=FALSE, fig.width=9, fig.height=6------------------------------
par(mfrow=ROWS, mar=MARGINS); x <- CompareNodeSupports(52)

## ---- echo=FALSE, fig.width=9, fig.height=6------------------------------
par(mfrow=ROWS, mar=MARGINS); x <- CompareNodeSupports(53)

## ---- echo=FALSE, fig.width=9, fig.height=6------------------------------
par(mfrow=ROWS, mar=MARGINS); x <- CompareNodeSupports(54)

## ---- echo=FALSE, fig.width=9, fig.height=6------------------------------
par(mfrow=ROWS, mar=MARGINS); x <- CompareNodeSupports(55)

## ---- echo=FALSE, fig.width=9, fig.height=6------------------------------
par(mfrow=ROWS, mar=MARGINS); x <- CompareNodeSupports(56)

## ---- echo=FALSE, fig.width=9, fig.height=6------------------------------
par(mfrow=ROWS, mar=MARGINS); x <- CompareNodeSupports(57)

## ---- echo=FALSE, fig.width=9, fig.height=6------------------------------
par(mfrow=ROWS, mar=MARGINS); x <- CompareNodeSupports(58)

## ---- echo=FALSE, fig.width=9, fig.height=6------------------------------
par(mfrow=ROWS, mar=MARGINS); x <- CompareNodeSupports(59)

## ---- echo=FALSE, fig.width=9, fig.height=6------------------------------
par(mfrow=ROWS, mar=MARGINS); x <- CompareNodeSupports(60)

## ---- echo=FALSE, fig.width=9, fig.height=6------------------------------
par(mfrow=ROWS, mar=MARGINS); x <- CompareNodeSupports(61)

## ---- echo=FALSE, fig.width=9, fig.height=6------------------------------
par(mfrow=ROWS, mar=MARGINS); x <- CompareNodeSupports(62)

## ---- echo=FALSE, fig.width=9, fig.height=6------------------------------
par(mfrow=ROWS, mar=MARGINS); x <- CompareNodeSupports(63)

## ---- echo=FALSE, fig.width=9, fig.height=6------------------------------
par(mfrow=ROWS, mar=MARGINS); x <- CompareNodeSupports(64)

## ---- echo=FALSE, fig.width=9, fig.height=6------------------------------
par(mfrow=ROWS, mar=MARGINS); x <- CompareNodeSupports(65)

## ---- echo=FALSE, fig.width=9, fig.height=6------------------------------
par(mfrow=ROWS, mar=MARGINS); x <- CompareNodeSupports(66)

## ---- echo=FALSE, fig.width=9, fig.height=6------------------------------
par(mfrow=ROWS, mar=MARGINS); x <- CompareNodeSupports(67)

## ---- echo=FALSE, fig.width=9, fig.height=6------------------------------
par(mfrow=ROWS, mar=MARGINS); x <- CompareNodeSupports(68)

## ---- echo=FALSE, fig.width=9, fig.height=6------------------------------
par(mfrow=ROWS, mar=MARGINS); x <- CompareNodeSupports(69)

## ---- echo=FALSE, fig.width=9, fig.height=6------------------------------
par(mfrow=ROWS, mar=MARGINS); x <- CompareNodeSupports(70)

## ---- echo=FALSE, fig.width=9, fig.height=6------------------------------
par(mfrow=ROWS, mar=MARGINS); x <- CompareNodeSupports(71)

## ---- echo=FALSE, fig.width=9, fig.height=6------------------------------
par(mfrow=ROWS, mar=MARGINS); x <- CompareNodeSupports(72)

## ---- echo=FALSE, fig.width=9, fig.height=6------------------------------
par(mfrow=ROWS, mar=MARGINS); x <- CompareNodeSupports(73)

## ---- echo=FALSE, fig.width=9, fig.height=6------------------------------
par(mfrow=ROWS, mar=MARGINS); x <- CompareNodeSupports(74)

## ---- echo=FALSE, fig.width=9, fig.height=6------------------------------
par(mfrow=ROWS, mar=MARGINS); x <- CompareNodeSupports(75)

## ---- echo=FALSE, fig.width=9, fig.height=6------------------------------
par(mfrow=ROWS, mar=MARGINS); x <- CompareNodeSupports(76)

## ---- echo=FALSE, fig.width=9, fig.height=6------------------------------
par(mfrow=ROWS, mar=MARGINS); x <- CompareNodeSupports(77)

## ---- echo=FALSE, fig.width=9, fig.height=6------------------------------
par(mfrow=ROWS, mar=MARGINS); x <- CompareNodeSupports(78)

## ---- echo=FALSE, fig.width=9, fig.height=6------------------------------
par(mfrow=ROWS, mar=MARGINS); x <- CompareNodeSupports(79)

## ---- echo=FALSE, fig.width=9, fig.height=6------------------------------
par(mfrow=ROWS, mar=MARGINS); x <- CompareNodeSupports(80)

## ---- echo=FALSE, fig.width=9, fig.height=6------------------------------
par(mfrow=ROWS, mar=MARGINS); x <- CompareNodeSupports(81)

## ---- echo=FALSE, fig.width=9, fig.height=6------------------------------
par(mfrow=ROWS, mar=MARGINS); x <- CompareNodeSupports(82)

## ---- echo=FALSE, fig.width=9, fig.height=6------------------------------
par(mfrow=ROWS, mar=MARGINS); x <- CompareNodeSupports(83)

## ---- echo=FALSE, fig.width=9, fig.height=6------------------------------
par(mfrow=ROWS, mar=MARGINS); x <- CompareNodeSupports(84)

## ---- echo=FALSE, fig.width=9, fig.height=6------------------------------
par(mfrow=ROWS, mar=MARGINS); x <- CompareNodeSupports(85)

## ---- echo=FALSE, fig.width=9, fig.height=6------------------------------
par(mfrow=ROWS, mar=MARGINS); x <- CompareNodeSupports(86)

## ---- echo=FALSE, fig.width=9, fig.height=6------------------------------
par(mfrow=ROWS, mar=MARGINS); x <- CompareNodeSupports(87)

## ---- echo=FALSE, fig.width=9, fig.height=6------------------------------
par(mfrow=ROWS, mar=MARGINS); x <- CompareNodeSupports(88)

## ---- echo=FALSE, fig.width=9, fig.height=6------------------------------
par(mfrow=ROWS, mar=MARGINS); x <- CompareNodeSupports(89)

## ---- echo=FALSE, fig.width=9, fig.height=6------------------------------
par(mfrow=ROWS, mar=MARGINS); x <- CompareNodeSupports(90)

## ---- echo=FALSE, fig.width=9, fig.height=6------------------------------
par(mfrow=ROWS, mar=MARGINS); x <- CompareNodeSupports(91)

## ---- echo=FALSE, fig.width=9, fig.height=6------------------------------
par(mfrow=ROWS, mar=MARGINS); x <- CompareNodeSupports(92)

## ---- echo=FALSE, fig.width=9, fig.height=6------------------------------
par(mfrow=ROWS, mar=MARGINS); x <- CompareNodeSupports(93)

## ---- echo=FALSE, fig.width=9, fig.height=6------------------------------
par(mfrow=ROWS, mar=MARGINS); x <- CompareNodeSupports(94)

## ---- echo=FALSE, fig.width=9, fig.height=6------------------------------
par(mfrow=ROWS, mar=MARGINS); x <- CompareNodeSupports(95)

## ---- echo=FALSE, fig.width=9, fig.height=6------------------------------
par(mfrow=ROWS, mar=MARGINS); x <- CompareNodeSupports(96)

## ---- echo=FALSE, fig.width=9, fig.height=6------------------------------
par(mfrow=ROWS, mar=MARGINS); x <- CompareNodeSupports(97)

## ---- echo=FALSE, fig.width=9, fig.height=6------------------------------
par(mfrow=ROWS, mar=MARGINS); x <- CompareNodeSupports(98)

## ---- echo=FALSE, fig.width=9, fig.height=6------------------------------
par(mfrow=ROWS, mar=MARGINS); x <- CompareNodeSupports(99)

## ---- echo=FALSE, fig.width=9, fig.height=6------------------------------
par(mfrow=ROWS, mar=MARGINS); x <- CompareNodeSupports(100)

