## ----prelim, echo=FALSE--------------------------------------------------
library(RcppZiggurat)
## this RData file contains the pre-run results 
##
##   [1] "chires"   "norres"   "rspeed"   "stdres"   "zigspeed"
##
## from the two speed comparions (ie rspeed and zigspeed) as well the three 
## simulation results (ie norres, stdres, and chires) 
##
## code for the two speed tests is shown below, the simulations results were run as
##
##   #!/bin/bash
##   Rscript -e 'library(RcppZiggurat); options("mc.cores"=6L); resS <- RcppZiggurat:::standardTest(5e9); saveRDS(resS, "standardTest.rds")' &
##   Rscript -e 'library(RcppZiggurat); options("mc.cores"=6L); resC <- RcppZiggurat:::chisqTest(1e10); saveRDS(resC, "chisqTest.rds")' &
##   Rscript -e 'library(RcppZiggurat); options("mc.cores"=6L); resN <- RcppZiggurat:::normalTest(5e9); saveRDS(resN, "normalTest.rds")' &
##
load("RcppZiggurat.RData")

## ----R_normal_RNGs,echo=FALSE,eval=FALSE---------------------------------
#  library(microbenchmark)
#  res <- microbenchmark({RNGkind(,"Kinderman-Ramage"); rnorm(1e6)},
#                        {RNGkind(,"Ahrens-Dieter"); rnorm(1e6)},
#                        {RNGkind(,"Box-Muller"); rnorm(1e6)},
#                        {RNGkind(,"Inversion"); rnorm(1e6)},
#                        times=100)
#  levels(res$expr) <- c("KR", "AH", "BM", "Inv")
#  #saveRDS(res, file="~/git/rcppziggurat/vignettes/Rspeed.rds")

## ----R_normal_RNGs_Plot,eval=FALSE,echo=FALSE,message=FALSE--------------
#  library(lattice)
#  rdf <- as.data.frame(rspeed)
#  rdf[,1] <- ordered(rdf[,1], levels=c("AH","KR","Inv","BM"), labels=c("AH","KR","Inv","BM"))
#  #pdf("plot1.pdf", 8, 8)
#  bwplot(time/1e6 ~ expr, rdf,
#         ylab="Time in msec",
#         main="Time for 100 times 1e6 normal draws",
#         lattice.options=list(fontsize=list(text=8, points=8)),
#         panel=function(...,box.ratio) { panel.violin(..., col="lightgray",
#                                                      varwidth=FALSE, box.ratio=box.ratio)} )
#                                          #dev.off()

## ----Zigg_normal_RNGs,echo=FALSE,eval=FALSE------------------------------
#  library(microbenchmark)
#  library(lattice)
#  library(RcppZiggurat)
#  N <- 1e6
#  res <- microbenchmark(rnorm(N),          # Marsgalia and Tsang, JSS, 2000
#                        zrnorm(N),         # based on updated Burkardt implementation
#                        zrnormGSL(N),      # GSL's ziggurat by Voss
#                        zrnormQL(N),       # QuantLib variant
#                        zrnormGl(N),       # Gretl
#                        times=100)
#  levels(res$expr) <- c("RInv", "Zigg", "ZiggGSL", "ZiggQL", "ZiggGretl")
#  #saveRDS(res, file="~/git/rcppziggurat/vignettes/Zigspeed.rds")

## ----Zigg_normal_RNGs_Plot,echo=FALSE,fig=TRUE,eval=FALSE----------------
#  library(lattice)
#  #res <- readRDS("~/git/rcppziggurat/vignettes/Zigspeed.rds")
#  zdf <- as.data.frame(zigspeed)
#  zdf[,1] <- ordered(zdf[,1],
#                     levels=c("Zigg", "ZiggGSL", "ZiggQL", "ZiggGretl", "RInv"),
#                     labels=c("Zigg", "ZiggGSL", "ZiggQL", "ZiggGretl", "RInv"))
#  print(bwplot(time/1e6 ~ expr, zdf, ylab="Time in msec",
#               main="Time for 100 times 1e6 normal draws",
#               panel=function(...,box.ratio) {
#                   panel.violin(..., col="lightgray", varwidth=FALSE, box.ratio=box.ratio)
#  }))

## ----stdtest, echo=FALSE, fig=TRUE, eval=FALSE---------------------------
#  RcppZiggurat:::plotAll(stdres)

## ----nortest, echo=FALSE, fig=TRUE, eval=FALSE---------------------------
#  RcppZiggurat:::plotAll(norres)

## ----chisqtest, echo=FALSE, print=FALSE, fig=TRUE, eval=FALSE------------
#  RcppZiggurat:::plotChiSq(chires)

