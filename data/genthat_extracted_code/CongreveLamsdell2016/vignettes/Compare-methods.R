## ----initialize, echo=FALSE, message=FALSE-------------------------------
library("Quartet")
library("Ternary")
library("CongreveLamsdell2016")
#if (!require("CongreveLamsdell2016")) devtools::load_all()
data('clBremPartitions', 'clBremQuartets', 'clMkvPartitions', 'clMkvQuartets',
     'clBootFreqPartitions', 'clBootFreqQuartets', 
     'clBootGcPartitions', 'clBootGcQuartets',
     'clJackFreqPartitions', 'clJackFreqQuartets',
     'clJackGcPartitions', 'clJackGcQuartets', 
     'clCI')

## ----initialize-variables, echo=FALSE------------------------------------
PCH <- c(
  brem  = 2,
  bootG = 0,
  bootF = 5,
  jackG = 3,
  jackF = 4,
  none  = NA,
  
  mk     = 1,
  markov = 1,
  equal  = 61, #'='
  eq     = 61,
  dot    = 183, #'.'
  
  k1         = 4,
  implied1   = 4,
  k2         = 183, 
  implied2   = 183,
  k3         = 183, 
  implied3   = 183,
  k5         = 3,
  implied5   = 3,
  kX         = 183,
  implied10  = 183,
  implied20  = 183,
  implied200 = 183,
  kC = 17,
  impliedC = 17  #triupfilled
)

COL <- c(
  black      = paste0(cbPalette8[1], '99'),
  markov     = paste0(cbPalette8[4], '99'),
  mk         = paste0(cbPalette8[4], '99'),
  
  equal      = paste0(cbPalette8[8], '99'),
  eq        = paste0(cbPalette8[8], '99'),
  implied1   = paste0(cbPalette8[6], '42'),
  k1         = paste0(cbPalette8[6], '42'),
  implied2   = paste0(cbPalette8[6], '42'),
  k2         = paste0(cbPalette8[6], '42'),
  implied3   = paste0(cbPalette8[6], '42'),
  k3         = paste0(cbPalette8[6], '42'),
  implied5   = paste0(cbPalette8[6], '42'),
  k5         = paste0(cbPalette8[6], '42'),
  implied10  = paste0(cbPalette8[6], '99'),
  kX         = paste0(cbPalette8[6], '99'),
  implied20  = paste0(cbPalette8[6], '42'),
  implied200 = paste0(cbPalette8[6], '42'),
  kC         = paste0(cbPalette8[2], '99'),
  impliedC   = paste0(cbPalette8[2], '99')
)

MARGINS <- c(2.8, 0.3, 0.3, 0.3)
ROWS <- c(1, 3)

TernaryQuarts<-function(TREE=TREE, zoom=1, padding=0.1) {
  clInitializeTernaryQuarts(zoom, padding)
  clPlotQuartets(clBootGcQuartets, TREE, cex=1.1, pch=PCH)
  clPlotQuartets(clMkvQuartets, TREE, cex=1.1, pch=PCH['mk'])

  # Return:
  invisible()
}


TernaryParts<-function(TREE=TREE) {
  clInitializeTernarySplits()
  clPlotSplits(clBootGcPartitions, TREE, cex=1.1, pch=PCH)
  clPlotSplits(clMkvPartitions, TREE, cex=1.1, pch=PCH['mk'])
  
  # Return:
  invisible()
}

AddLegend <- function(pos='bottomright') {
  legend(pos, cex=0.8, bty='n',
         lty=1,
         pch=PCH[c('mk', 'eq', 'kX', 'k5', 'k3', 'k1', 'kC')], pt.cex=1.1,
         col=COL[c('mk', 'eq', 'kX', 'k5', 'k3', 'k1', 'kC')],
         legend=c('Markov', 'Equal weights', 
                  paste0('Implied, k=', c(10, 5, '2, 3', 1, '2..10'))))
}

Plottem <- function (i) { 
  TernaryQuarts(TREE=i)
  
  title(main=paste0("\nQuartets"), cex.main=0.8)
  arrows(sqrt(3/4) * 0.5, 0.5, sqrt(3/4) * 0.8, 0.5, length=0.1)
  text  (sqrt(3/4) * 0.65, 0.5, pos=3, 'Decreasing resolution', cex=0.8)
  
  arrows(sqrt(3/4) * 0.98, 0.40, sqrt(3/4) * 0.98, 0.20, length=0.1)
  text  (sqrt(3/4) * 1.01, 0.30, pos=3, 'Increasing divergence', cex=0.8, srt=270)
  
  TernaryQuarts(TREE=i, zoom=3, padding=0.01)
  title(main=paste0("\nDataset ", i, ": CI=",round(clCI[i], 2)), cex.main=1.2)
  
  TernaryParts(TREE=i)
  
  arrows(sqrt(3/4) * 0.98, 0.40, sqrt(3/4) * 0.98, 0.20, length=0.1)
  text  (sqrt(3/4) * 1.01, 0.30, pos=3, 'Increasing RF distance', cex=0.8, srt=270)
  
  AddLegend()
}

## ----Summary, echo=FALSE, fig.width=9, fig.height=3----------------------
x <- Sys.setlocale("LC_ALL", "C") # allows PCH=183
par(mfrow=c(1, ROWS[2]), mar=MARGINS)

clInitializeTernaryQuarts()
clPlotAverageQuartets(clBootGcQuartets, cex=1.1, pch=PCH)
clPlotAverageQuartets(clMkvQuartets, cex=1.1, pch=PCH['mk'])

title(main=paste0("\nQuartets"), cex.main=0.8)
arrows(sqrt(3/4) * 0.5, 0.5, sqrt(3/4) * 0.8, 0.5, length=0.1)
text  (sqrt(3/4) * 0.65, 0.5, pos=3, 'Decreasing resolution', cex=0.8)

arrows(sqrt(3/4) * 0.98, 0.40, sqrt(3/4) * 0.98, 0.20, length=0.1)
text  (sqrt(3/4) * 1.01, 0.30, pos=3, 'Increasing divergence', cex=0.8, srt=270)


clInitializeTernaryQuarts(zoom=3, padding=0.01)
clPlotAverageQuartets(clBootGcQuartets, cex=1.1, pch=PCH)
clPlotAverageQuartets(clMkvQuartets, cex=1.1, pch=PCH['mk'])
title("\nResults for all datasets (means)", cex.main=1.2)

clInitializeTernarySplits()
clPlotAverageSplits(clBootGcPartitions, cex=1.1, pch=PCH)
clPlotAverageSplits(clMkvPartitions, cex=1.1, pch=PCH['mk'])

arrows(sqrt(3/4) * 0.98, 0.40, sqrt(3/4) * 0.98, 0.20, length=0.1)
text  (sqrt(3/4) * 1.01, 0.30, pos=3, 'Increasing RF distance', cex=0.8, srt=270)

AddLegend()

## ---- echo=FALSE, fig.width=9, fig.height=6------------------------------
par(mfrow=ROWS, mar=MARGINS); x <- Plottem(1)

## ---- echo=FALSE, fig.width=9, fig.height=6------------------------------
par(mfrow=ROWS, mar=MARGINS); x <- Plottem(2)

## ---- echo=FALSE, fig.width=9, fig.height=6------------------------------
par(mfrow=ROWS, mar=MARGINS); x <- Plottem(3)

## ---- echo=FALSE, fig.width=9, fig.height=6------------------------------
par(mfrow=ROWS, mar=MARGINS); x <- Plottem(4)

## ---- echo=FALSE, fig.width=9, fig.height=6------------------------------
par(mfrow=ROWS, mar=MARGINS); x <- Plottem(5)

## ---- echo=FALSE, fig.width=9, fig.height=6------------------------------
par(mfrow=ROWS, mar=MARGINS); x <- Plottem(6)

## ---- echo=FALSE, fig.width=9, fig.height=6------------------------------
par(mfrow=ROWS, mar=MARGINS); x <- Plottem(7)

## ---- echo=FALSE, fig.width=9, fig.height=6------------------------------
par(mfrow=ROWS, mar=MARGINS); x <- Plottem(8)

## ---- echo=FALSE, fig.width=9, fig.height=6------------------------------
par(mfrow=ROWS, mar=MARGINS); x <- Plottem(9)

## ---- echo=FALSE, fig.width=9, fig.height=6------------------------------
par(mfrow=ROWS, mar=MARGINS); x <- Plottem(10)

## ---- echo=FALSE, fig.width=9, fig.height=6------------------------------
par(mfrow=ROWS, mar=MARGINS); x <- Plottem(11)

## ---- echo=FALSE, fig.width=9, fig.height=6------------------------------
par(mfrow=ROWS, mar=MARGINS); x <- Plottem(12)

## ---- echo=FALSE, fig.width=9, fig.height=6------------------------------
par(mfrow=ROWS, mar=MARGINS); x <- Plottem(13)

## ---- echo=FALSE, fig.width=9, fig.height=6------------------------------
par(mfrow=ROWS, mar=MARGINS); x <- Plottem(14)

## ---- echo=FALSE, fig.width=9, fig.height=6------------------------------
par(mfrow=ROWS, mar=MARGINS); x <- Plottem(15)

## ---- echo=FALSE, fig.width=9, fig.height=6------------------------------
par(mfrow=ROWS, mar=MARGINS); x <- Plottem(16)

## ---- echo=FALSE, fig.width=9, fig.height=6------------------------------
par(mfrow=ROWS, mar=MARGINS); x <- Plottem(17)

## ---- echo=FALSE, fig.width=9, fig.height=6------------------------------
par(mfrow=ROWS, mar=MARGINS); x <- Plottem(18)

## ---- echo=FALSE, fig.width=9, fig.height=6------------------------------
par(mfrow=ROWS, mar=MARGINS); x <- Plottem(19)

## ---- echo=FALSE, fig.width=9, fig.height=6------------------------------
par(mfrow=ROWS, mar=MARGINS); x <- Plottem(20)

## ---- echo=FALSE, fig.width=9, fig.height=6------------------------------
par(mfrow=ROWS, mar=MARGINS); x <- Plottem(21)

## ---- echo=FALSE, fig.width=9, fig.height=6------------------------------
par(mfrow=ROWS, mar=MARGINS); x <- Plottem(22)

## ---- echo=FALSE, fig.width=9, fig.height=6------------------------------
par(mfrow=ROWS, mar=MARGINS); x <- Plottem(23)

## ---- echo=FALSE, fig.width=9, fig.height=6------------------------------
par(mfrow=ROWS, mar=MARGINS); x <- Plottem(24)

## ---- echo=FALSE, fig.width=9, fig.height=6------------------------------
par(mfrow=ROWS, mar=MARGINS); x <- Plottem(25)

## ---- echo=FALSE, fig.width=9, fig.height=6------------------------------
par(mfrow=ROWS, mar=MARGINS); x <- Plottem(26)

## ---- echo=FALSE, fig.width=9, fig.height=6------------------------------
par(mfrow=ROWS, mar=MARGINS); x <- Plottem(27)

## ---- echo=FALSE, fig.width=9, fig.height=6------------------------------
par(mfrow=ROWS, mar=MARGINS); x <- Plottem(28)

## ---- echo=FALSE, fig.width=9, fig.height=6------------------------------
par(mfrow=ROWS, mar=MARGINS); x <- Plottem(29)

## ---- echo=FALSE, fig.width=9, fig.height=6------------------------------
par(mfrow=ROWS, mar=MARGINS); x <- Plottem(30)

## ---- echo=FALSE, fig.width=9, fig.height=6------------------------------
par(mfrow=ROWS, mar=MARGINS); x <- Plottem(31)

## ---- echo=FALSE, fig.width=9, fig.height=6------------------------------
par(mfrow=ROWS, mar=MARGINS); x <- Plottem(32)

## ---- echo=FALSE, fig.width=9, fig.height=6------------------------------
par(mfrow=ROWS, mar=MARGINS); x <- Plottem(33)

## ---- echo=FALSE, fig.width=9, fig.height=6------------------------------
par(mfrow=ROWS, mar=MARGINS); x <- Plottem(34)

## ---- echo=FALSE, fig.width=9, fig.height=6------------------------------
par(mfrow=ROWS, mar=MARGINS); x <- Plottem(35)

## ---- echo=FALSE, fig.width=9, fig.height=6------------------------------
par(mfrow=ROWS, mar=MARGINS); x <- Plottem(36)

## ---- echo=FALSE, fig.width=9, fig.height=6------------------------------
par(mfrow=ROWS, mar=MARGINS); x <- Plottem(37)

## ---- echo=FALSE, fig.width=9, fig.height=6------------------------------
par(mfrow=ROWS, mar=MARGINS); x <- Plottem(38)

## ---- echo=FALSE, fig.width=9, fig.height=6------------------------------
par(mfrow=ROWS, mar=MARGINS); x <- Plottem(39)

## ---- echo=FALSE, fig.width=9, fig.height=6------------------------------
par(mfrow=ROWS, mar=MARGINS); x <- Plottem(40)

## ---- echo=FALSE, fig.width=9, fig.height=6------------------------------
par(mfrow=ROWS, mar=MARGINS); x <- Plottem(41)

## ---- echo=FALSE, fig.width=9, fig.height=6------------------------------
par(mfrow=ROWS, mar=MARGINS); x <- Plottem(42)

## ---- echo=FALSE, fig.width=9, fig.height=6------------------------------
par(mfrow=ROWS, mar=MARGINS); x <- Plottem(43)

## ---- echo=FALSE, fig.width=9, fig.height=6------------------------------
par(mfrow=ROWS, mar=MARGINS); x <- Plottem(44)

## ---- echo=FALSE, fig.width=9, fig.height=6------------------------------
par(mfrow=ROWS, mar=MARGINS); x <- Plottem(45)

## ---- echo=FALSE, fig.width=9, fig.height=6------------------------------
par(mfrow=ROWS, mar=MARGINS); x <- Plottem(46)

## ---- echo=FALSE, fig.width=9, fig.height=6------------------------------
par(mfrow=ROWS, mar=MARGINS); x <- Plottem(47)

## ---- echo=FALSE, fig.width=9, fig.height=6------------------------------
par(mfrow=ROWS, mar=MARGINS); x <- Plottem(48)

## ---- echo=FALSE, fig.width=9, fig.height=6------------------------------
par(mfrow=ROWS, mar=MARGINS); x <- Plottem(49)

## ---- echo=FALSE, fig.width=9, fig.height=6------------------------------
par(mfrow=ROWS, mar=MARGINS); x <- Plottem(50)

## ---- echo=FALSE, fig.width=9, fig.height=6------------------------------
par(mfrow=ROWS, mar=MARGINS); x <- Plottem(51)

## ---- echo=FALSE, fig.width=9, fig.height=6------------------------------
par(mfrow=ROWS, mar=MARGINS); x <- Plottem(52)

## ---- echo=FALSE, fig.width=9, fig.height=6------------------------------
par(mfrow=ROWS, mar=MARGINS); x <- Plottem(53)

## ---- echo=FALSE, fig.width=9, fig.height=6------------------------------
par(mfrow=ROWS, mar=MARGINS); x <- Plottem(54)

## ---- echo=FALSE, fig.width=9, fig.height=6------------------------------
par(mfrow=ROWS, mar=MARGINS); x <- Plottem(55)

## ---- echo=FALSE, fig.width=9, fig.height=6------------------------------
par(mfrow=ROWS, mar=MARGINS); x <- Plottem(56)

## ---- echo=FALSE, fig.width=9, fig.height=6------------------------------
par(mfrow=ROWS, mar=MARGINS); x <- Plottem(57)

## ---- echo=FALSE, fig.width=9, fig.height=6------------------------------
par(mfrow=ROWS, mar=MARGINS); x <- Plottem(58)

## ---- echo=FALSE, fig.width=9, fig.height=6------------------------------
par(mfrow=ROWS, mar=MARGINS); x <- Plottem(59)

## ---- echo=FALSE, fig.width=9, fig.height=6------------------------------
par(mfrow=ROWS, mar=MARGINS); x <- Plottem(60)

## ---- echo=FALSE, fig.width=9, fig.height=6------------------------------
par(mfrow=ROWS, mar=MARGINS); x <- Plottem(61)

## ---- echo=FALSE, fig.width=9, fig.height=6------------------------------
par(mfrow=ROWS, mar=MARGINS); x <- Plottem(62)

## ---- echo=FALSE, fig.width=9, fig.height=6------------------------------
par(mfrow=ROWS, mar=MARGINS); x <- Plottem(63)

## ---- echo=FALSE, fig.width=9, fig.height=6------------------------------
par(mfrow=ROWS, mar=MARGINS); x <- Plottem(64)

## ---- echo=FALSE, fig.width=9, fig.height=6------------------------------
par(mfrow=ROWS, mar=MARGINS); x <- Plottem(65)

## ---- echo=FALSE, fig.width=9, fig.height=6------------------------------
par(mfrow=ROWS, mar=MARGINS); x <- Plottem(66)

## ---- echo=FALSE, fig.width=9, fig.height=6------------------------------
par(mfrow=ROWS, mar=MARGINS); x <- Plottem(67)

## ---- echo=FALSE, fig.width=9, fig.height=6------------------------------
par(mfrow=ROWS, mar=MARGINS); x <- Plottem(68)

## ---- echo=FALSE, fig.width=9, fig.height=6------------------------------
par(mfrow=ROWS, mar=MARGINS); x <- Plottem(69)

## ---- echo=FALSE, fig.width=9, fig.height=6------------------------------
par(mfrow=ROWS, mar=MARGINS); x <- Plottem(70)

## ---- echo=FALSE, fig.width=9, fig.height=6------------------------------
par(mfrow=ROWS, mar=MARGINS); x <- Plottem(71)

## ---- echo=FALSE, fig.width=9, fig.height=6------------------------------
par(mfrow=ROWS, mar=MARGINS); x <- Plottem(72)

## ---- echo=FALSE, fig.width=9, fig.height=6------------------------------
par(mfrow=ROWS, mar=MARGINS); x <- Plottem(73)

## ---- echo=FALSE, fig.width=9, fig.height=6------------------------------
par(mfrow=ROWS, mar=MARGINS); x <- Plottem(74)

## ---- echo=FALSE, fig.width=9, fig.height=6------------------------------
par(mfrow=ROWS, mar=MARGINS); x <- Plottem(75)

## ---- echo=FALSE, fig.width=9, fig.height=6------------------------------
par(mfrow=ROWS, mar=MARGINS); x <- Plottem(76)

## ---- echo=FALSE, fig.width=9, fig.height=6------------------------------
par(mfrow=ROWS, mar=MARGINS); x <- Plottem(77)

## ---- echo=FALSE, fig.width=9, fig.height=6------------------------------
par(mfrow=ROWS, mar=MARGINS); x <- Plottem(78)

## ---- echo=FALSE, fig.width=9, fig.height=6------------------------------
par(mfrow=ROWS, mar=MARGINS); x <- Plottem(79)

## ---- echo=FALSE, fig.width=9, fig.height=6------------------------------
par(mfrow=ROWS, mar=MARGINS); x <- Plottem(80)

## ---- echo=FALSE, fig.width=9, fig.height=6------------------------------
par(mfrow=ROWS, mar=MARGINS); x <- Plottem(81)

## ---- echo=FALSE, fig.width=9, fig.height=6------------------------------
par(mfrow=ROWS, mar=MARGINS); x <- Plottem(82)

## ---- echo=FALSE, fig.width=9, fig.height=6------------------------------
par(mfrow=ROWS, mar=MARGINS); x <- Plottem(83)

## ---- echo=FALSE, fig.width=9, fig.height=6------------------------------
par(mfrow=ROWS, mar=MARGINS); x <- Plottem(84)

## ---- echo=FALSE, fig.width=9, fig.height=6------------------------------
par(mfrow=ROWS, mar=MARGINS); x <- Plottem(85)

## ---- echo=FALSE, fig.width=9, fig.height=6------------------------------
par(mfrow=ROWS, mar=MARGINS); x <- Plottem(86)

## ---- echo=FALSE, fig.width=9, fig.height=6------------------------------
par(mfrow=ROWS, mar=MARGINS); x <- Plottem(87)

## ---- echo=FALSE, fig.width=9, fig.height=6------------------------------
par(mfrow=ROWS, mar=MARGINS); x <- Plottem(88)

## ---- echo=FALSE, fig.width=9, fig.height=6------------------------------
par(mfrow=ROWS, mar=MARGINS); x <- Plottem(89)

## ---- echo=FALSE, fig.width=9, fig.height=6------------------------------
par(mfrow=ROWS, mar=MARGINS); x <- Plottem(90)

## ---- echo=FALSE, fig.width=9, fig.height=6------------------------------
par(mfrow=ROWS, mar=MARGINS); x <- Plottem(91)

## ---- echo=FALSE, fig.width=9, fig.height=6------------------------------
par(mfrow=ROWS, mar=MARGINS); x <- Plottem(92)

## ---- echo=FALSE, fig.width=9, fig.height=6------------------------------
par(mfrow=ROWS, mar=MARGINS); x <- Plottem(93)

## ---- echo=FALSE, fig.width=9, fig.height=6------------------------------
par(mfrow=ROWS, mar=MARGINS); x <- Plottem(94)

## ---- echo=FALSE, fig.width=9, fig.height=6------------------------------
par(mfrow=ROWS, mar=MARGINS); x <- Plottem(95)

## ---- echo=FALSE, fig.width=9, fig.height=6------------------------------
par(mfrow=ROWS, mar=MARGINS); x <- Plottem(96)

## ---- echo=FALSE, fig.width=9, fig.height=6------------------------------
par(mfrow=ROWS, mar=MARGINS); x <- Plottem(97)

## ---- echo=FALSE, fig.width=9, fig.height=6------------------------------
par(mfrow=ROWS, mar=MARGINS); x <- Plottem(98)

## ---- echo=FALSE, fig.width=9, fig.height=6------------------------------
par(mfrow=ROWS, mar=MARGINS); x <- Plottem(99)

## ---- echo=FALSE, fig.width=9, fig.height=6------------------------------
par(mfrow=ROWS, mar=MARGINS); x <- Plottem(100)

