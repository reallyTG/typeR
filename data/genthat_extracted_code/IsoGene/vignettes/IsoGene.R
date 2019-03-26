### R code from vignette source 'IsoGene.Rnw'

###################################################
### code chunk number 1: loadPackage
###################################################
	library(IsoGene)


###################################################
### code chunk number 2: IsoGene.Rnw:1232-1233 (eval = FALSE)
###################################################
## 	help(package = IsoGene)


###################################################
### code chunk number 3: loadData
###################################################
	data(exampleData)


###################################################
### code chunk number 4: IsoPlot (eval = FALSE)
###################################################
##   x <- c(rep(1, 3), rep(2, 3), rep(3, 3), rep(4, 3))
##   gene1 <-as.matrix(exampleData[2,])
##   par(mfrow = c(1, 2))
##   IsoPlot(x, y = gene1) 
##   IsoPlot(x, y = gene1, type = "ordinal", add.curve = TRUE)	


###################################################
### code chunk number 5: Plot
###################################################
  #png (filename = "IsoGene-IsoPlot.png", width = 300, height = 280)
  pdf (file = "IsoGene-IsoPlot.pdf", width = 4.5, height = 3.5)
  x <- c(rep(1, 3), rep(2, 3), rep(3, 3), rep(4, 3))
  gene1 <-as.matrix(exampleData[2,])
  par(mfrow = c(1, 2))
  IsoPlot(x, y = gene1) 
  IsoPlot(x, y = gene1, type = "ordinal", add.curve = TRUE)	
  graphics.off() 
  


###################################################
### code chunk number 6: IsoGene1
###################################################
stat1 <- IsoGene1(x, gene1)


###################################################
### code chunk number 7: stat1
###################################################
	stat1


###################################################
### code chunk number 8: IsoGenem
###################################################
  statm <- IsoGenem(x, exampleData[1:10,])
  statm


###################################################
### code chunk number 9: IsoRawp
###################################################
  rawp <- IsoRawp(x = x, y = exampleData, niter = 2)


###################################################
### code chunk number 10: rawptwosided
###################################################
	rawp.twosided <- rawp[[1]]


###################################################
### code chunk number 11: IsoGene.Rnw:1410-1411
###################################################
	rawp.twosided[1:10,]


###################################################
### code chunk number 12: IsoGene.Rnw:1429-1431 (eval = FALSE)
###################################################
##   IsopvaluePlot(x, y, niter, stat = c("E2", "Williams",
##     "Marcus", "M", "ModifM"))


###################################################
### code chunk number 13: IsopvaluePlot (eval = FALSE)
###################################################
##   IsopvaluePlot(x, gene1, niter=1000, stat="E2")


###################################################
### code chunk number 14: Plot3
###################################################
#png (filename = "IsoGene-IsopvaluePlot.png", width = 380, height = 300)
pdf (file = "IsoGene-IsopvaluePlot.pdf", width = 4, height = 5)

IsopvaluePlot(x, gene1, niter=1000, stat="E2")
 graphics.off() 
 


###################################################
### code chunk number 15: IsoTestBH (eval = FALSE)
###################################################
##   IsoTestBH(rp, FDR = c(0.05,0.1), type = c("BH","BY"),
##     stat=c("E2","Williams","Marcus","M","ModifM"))


###################################################
### code chunk number 16: E2BH
###################################################
  E2.BH <- IsoTestBH(rawp.twosided, FDR=0.05, type="BH", stat="E2")


###################################################
### code chunk number 17: E2BHrows
###################################################
  E2.BH[1:10, ]	


###################################################
### code chunk number 18: IsoBHPlotExample (eval = FALSE)
###################################################
##   IsoBHPlot(rp, FDR = c(0.05,0.1),
##     stat=c("E2","Williams","Marcus","M","ModifM"))


###################################################
### code chunk number 19: IsoBHPlot (eval = FALSE)
###################################################
## 	IsoBHPlot(rawp.twosided, FDR=0.05, stat="E2")


###################################################
### code chunk number 20: Plot2
###################################################
# png (filename = "IsoGene-IsoBHPlot.png", width = 380, height = 380)
  
pdf (file = "IsoGene-IsoBHPlot.pdf", width = 4, height =4)
IsoBHPlot(rawp.twosided, FDR=0.05, stat="E2")
graphics.off() 


###################################################
### code chunk number 21: IsoSyntax (eval = FALSE)
###################################################
##   Isofudge(x, y)
##   IsoGenemSAM(x, y, fudge.factor)
##   Isoqqstat(x, y, fudge=c(0,"pooled"), niter=100)
##   Isoallfdr(qqstat, ddelta, stat = c("E2","Williams","Marcus","M","ModifM"))
##   Isoqval(delta, allfdr, qqstat, stat)	


###################################################
### code chunk number 22: fudgeFactor
###################################################
  fudge.factor <- Isofudge(x, exampleData)


###################################################
### code chunk number 23: fudgeFactorOutput
###################################################
  fudge.factor


###################################################
### code chunk number 24: SAMtest
###################################################
  SAMtest.stat <- IsoGenemSAM(x, exampleData, fudge.factor)


###################################################
### code chunk number 25: namesSAMtest
###################################################
	names(SAMtest.stat)


###################################################
### code chunk number 26: SAMtestStat
###################################################
  SAMtest.stat[[1]][1:10]
  SAMtest.stat[[2]][1:10]
  SAMtest.stat[[3]][1:10]
  SAMtest.stat[[4]][1:10]
  SAMtest.stat[[5]][1:10]
  SAMtest.stat[[6]][1:10]


###################################################
### code chunk number 27: qqstat
###################################################
	qqstat <- Isoqqstat(x, exampleData, fudge="pooled", niter=2) # TODO: change back to 100
  dtable <-  Isoallfdr(qqstat, , stat="ModifM")
  # TODO: identify row with largest FDR < 0.05


###################################################
### code chunk number 28: qqstat
###################################################
  dim(dtable)
  head(dtable)


###################################################
### code chunk number 29: table0
###################################################
library(xtable)
a <- head(dtable, n = 4)
b <- tail(dtable, n = 4)
#tab0 <- xtable(rbind(a,".",".",".",b))
#print(tab0, type="latex", hline.after=NULL,include.rownames=FALSE, table.placement="!h",
#		latex.environments=c("left"))


###################################################
### code chunk number 30: qvalOutput1
###################################################
  qval <- Isoqval(delta=0.83, allfdr=dtable, qqstat=qqstat,
    stat="ModifM")
  dim(qval[[1]])
  head(qval[[1]])


###################################################
### code chunk number 31: table1
###################################################
library(xtable)
a <- head(qval[[1]])
b <- tail(qval[[1]])
#tab1 <- xtable(rbind(a,"..",b))

#print(tab1, type="latex", hline.after=NULL, table.placement="!h",
#		latex.environments=c("left"),include.rownames=T)


###################################################
### code chunk number 32: qvalOutput2
###################################################
  dim(qval[[2]])
  head(qval[[2]])


###################################################
### code chunk number 33: table2
###################################################
library(xtable)
c <- head(qval[[2]])
d <- tail(qval[[2]])
#tab2 <- xtable(rbind(c,"...",d))
#print(tab2, type="latex", hline.after=NULL, table.placement="!h",
#		latex.environments=c("left"),include.rownames=T)


###################################################
### code chunk number 34: IsoTestSAM (eval = FALSE)
###################################################
##   IsoTestSAM(x, y=data, fudge=c(0,"pooled"), niter=100, 
##     FDR=0.05, stat=c("E2","Williams","Marcus","M","ModifM"))


###################################################
### code chunk number 35: IsoSAMobj
###################################################
  IsoSAM.obj <- IsoTestSAM (x, y = exampleData, fudge = "pooled", 
    niter = 2, FDR = 0.05, stat = "ModifM") # change number of iterations to 100


###################################################
### code chunk number 36: IsoGene.Rnw:1706-1709
###################################################
 IsoSAM.sig  <- IsoSAM.obj [[1]]
 dim(IsoSAM.sig)
 head(IsoSAM.sig)


###################################################
### code chunk number 37: table2
###################################################
library(xtable)
a <- head(IsoSAM.sig)
b <- tail(IsoSAM.sig)
#suppressWarnings(tab3 <- xtable(rbind(a,".",".",".",b)))
#print(tab3, type="latex", hline.after=NULL,include.rownames=FALSE, table.placement="!h",
#		latex.environments=c("left"))


###################################################
### code chunk number 38: IsoSAMPlot (eval = FALSE)
###################################################
## 	IsoSAMPlot(qqstat, allfdr, FDR=0.05, stat=c("E2","Williams",
##     "Marcus","M","ModifM"))


###################################################
### code chunk number 39: IsoSAMPlotOutput (eval = FALSE)
###################################################
## 	IsoSAMPlot(qqstat = qqstat, allfdr = dtable, FDR = 0.05, stat = "ModifM")


###################################################
### code chunk number 40: Plot4
###################################################
pdf (file = "IsoGene-IsoSAMPlotOutput.pdf", width = 5, height =5 )
IsoSAMPlot(qqstat = qqstat, allfdr = dtable, FDR = 0.05, stat = "ModifM")
graphics.off() 


