## ----setup, include = FALSE----------------------------------------------
knitr::opts_chunk$set(warning=FALSE, message=FALSE, cache=FALSE, 
               comment=NA, verbose=TRUE, fig.width=5, fig.height=5, dev='jpeg',dev.args=list(quality=50))			   

## ---- fig.width=5, fig.height=5, message=FALSE---------------------------
library(imagerExtra)
g <- grayscale(boats)
gd <- grayscale(dogs)
layout(matrix(1:2,1,2))
plot(g, main = "boats")
plot(gd, main = "dogs")

## ---- fig.width=8, fig.height=8------------------------------------------
layout(matrix(1:4, 2, 2))
plot(g, main = "Original")
EqualizePiecewise(g, 2) %>% plot(main = "N = 2")
EqualizePiecewise(g, 10) %>% plot(main = "N = 10")
EqualizePiecewise(g, 1000) %>% plot(main = "N = 1000")

## ---- fig.width=7--------------------------------------------------------
layout(matrix(1:2, 1, 2))
plot(g, main = "Original")
BalanceSimplest(g, 1, 1) %>% plot(main = "sleft = 1, sright = 1")

## ---- fig.height=3-------------------------------------------------------
layout(matrix(1:2, 1, 2))
plot(papers, main = "Original")
SPE(papers, 0.1) %>% plot(main = "SPE (lamda = 0.1)")

## ---- fig.width=7--------------------------------------------------------
layout(matrix(1:2, 1, 2))
plot(gd, main = "Original")
EqualizeDP(gd, 25, 110) %>% plot(main = "DPHE")

## ---- fig.width=7--------------------------------------------------------
layout(matrix(1:2, 1, 2))
plot(gd, main = "Original")
EqualizeADP(gd) %>% plot(main = "ADPHE")

## ---- fig.width=7, fig.height=7------------------------------------------
noisy <- g + imnoise(dim = dim(g), sd = 0.1)
layout(matrix(c(1,3,2,4), 2, 2))
plot(g, main = "Original")
plot(noisy, main = "Noisy Boats")
DenoiseDCT(noisy, 0.1) %>% plot(., main = "Denoised (8x8 window)")
DenoiseDCT(noisy, 0.1, flag_dct16x16 = TRUE) %>% plot(., main = "Denoised (16x16 window)")

## ---- fig.width=7, fig.height=7------------------------------------------
gdogs <- grayscale(dogs)
layout(matrix(1:4, 2, 2, byrow = TRUE))
plot(gdogs, main = "Original", axes=F)
ThresholdTriclass(gdogs, stopval = 0.001) %>% plot(main = "stopval = 0.001")
ThresholdTriclass(gdogs, repeatnum = 1) %>% plot(main = "repeatnum = 1")
ThresholdTriclass(gdogs, repeatnum = 3) %>% plot(main = "repeatnum = 3")

## ---- fig.height=3-------------------------------------------------------
layout(matrix(1:2,1,2))
plot(papers, main = "Original")
hello <- ThresholdAdaptive(papers, 0.1, windowsize = 17, range = c(0,1))
plot(hello, main = "Binarizesd")

## ---- fig.width=7--------------------------------------------------------
layout(matrix(1:2,1,2))
plot(g, main = "Original")
ThresholdFuzzy(g) %>% plot(main = "Fuzzy Thresholding")

## ---- fig.width=7--------------------------------------------------------
layout(matrix(1:2,1,2))
ThresholdML(g, k = 3) %>% plot(main = "Level of Thresholds: 3")
ThresholdML(g, thr = c(0.2, 0.4, 0.6)) %>% plot(main = "Thresholds: 0.2, 0.4, and 0.6")

## ---- fig.width=7--------------------------------------------------------
layout(matrix(1:2, 1, 2))
plot(gd, main = "Original")
SegmentCV(gd, lambda2 = 15) %>% plot(main = "Chan-Vese")

