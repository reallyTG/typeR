## ----path-to-data, eval=TRUE---------------------------------------------
library(DAAGbio)
path2data <- system.file("doc", package="DAAGbio")

## ----load-limma, echo=TRUE, eval=TRUE------------------------------------
library(limma)

## ----readTargets, echo=TRUE, eval=TRUE, results="hide"-------------------
targets <- readTargets("coralTargets.txt", path=path2data)
targets$FileName     # Display the file names

## ----see-targets, echo=TRUE, eval=FALSE----------------------------------
#  targets

## ----read-images, echo=TRUE, eval=TRUE, results="hide"-------------------
coralRG <- read.maimages(targets$FileName, source = "spot",
    path=path2data,
    other.columns=list(area="area", badspot="badspot"))

## ----echo=TRUE, eval=TRUE, results="hide"--------------------------------
summary(coralRG$other$area)

## ----echo=TRUE, eval=TRUE------------------------------------------------
plot(density(coralRG$other$area[,1]))

## ----echo=TRUE, eval=TRUE, results="hide"--------------------------------
coralRG$genes <- readGAL(path=path2data)
coralRG$printer <- getLayout(coralRG$genes)
coralRG$printer

## ----printseq------------------------------------------------------------
plotprintseq()

## ----echo=TRUE, eval=TRUE------------------------------------------------
spottypes<-readSpotTypes(path=path2data)
coralRG$genes$Status <- controlStatus(spottypes, coralRG)

## ----echo=TRUE, eval=TRUE------------------------------------------------
imageplot(log2(coralRG$Rb[, 1]+1), layout = coralRG$printer,
          low="white", high="red")

## ----echo=TRUE, eval=TRUE------------------------------------------------
imageplot(log2(coralRG$Rb[, 2]+1), layout = coralRG$printer,
          low="white", high="red")

## ----six-plots, eval=FALSE-----------------------------------------------
#  x11(width=7.5, height=11)
#  xplot(data = coralRG$R, layout = coralRG$printer, FUN=imageplot)

## ----hard-copy, eval=FALSE-----------------------------------------------
#  quartz(width=7.5, height=11)
#  xplot(data = coralRG$R, layout = coralRG$printer, FUN=imageplot,
#         device=pdf)

## ----echo=TRUE, eval=TRUE------------------------------------------------
plotMA(coralRG, array=1)

## ----all-six, eval=FALSE-------------------------------------------------
#  oldpar <- par(mfrow=c(3,2), mar=c(5.1, 4.1, 1.1, 0.6))
#  ## When done with the 3 by 2 layout, be sure to type
#  par(oldpar)     # This returns to the original settings.

## ----echo=TRUE, eval=TRUE------------------------------------------------
rawMA <- normalizeWithinArrays(coralRG, method = "none")
plotPrintTipLoess(rawMA, array=1)

## ----echo=TRUE, eval=TRUE------------------------------------------------
MA <- normalizeWithinArrays(coralRG, method = "printtiploess")
plotPrintTipLoess(MA)

## ----echo=TRUE, eval=FALSE-----------------------------------------------
#  boxplot(MA$M ~ col(MA$M), names = colnames(MA$M))

## ----echo=TRUE, eval=TRUE------------------------------------------------
nMA <- normalizeBetweenArrays(MA)
boxplot(nMA$M ~ col(nMA$M), names = colnames(nMA$M))

## ----echo=TRUE, eval=TRUE------------------------------------------------
wanted <- coralRG$genes$Status == "diff-exp ctl"
rawdeM <- rawMA$M[wanted, ]
pairs(rawdeM)

## ----echo=TRUE, eval=TRUE------------------------------------------------
wanted <- coralRG$genes$Status == "diff-exp ctl"
deM <- nMA$M[wanted, ]
pairs(rawdeM)

## ----echo=TRUE, eval=TRUE------------------------------------------------
imageplot(nMA$M[,5], layout=coralRG$printer)

## ----echo=TRUE, eval=TRUE------------------------------------------------
design <- c(-1, 1, -1, 1, 0, 1)

## ----echo=TRUE, eval=TRUE------------------------------------------------
fit <- lmFit(nMA, design)

## ----echo=TRUE, eval=TRUE------------------------------------------------
efit <- eBayes(fit)
qqt(efit$t, df = efit$df.prior + efit$df.residual, pch = 16,
    cex = 0.2)

## ----echo=TRUE, eval=TRUE, results="hide"--------------------------------
options(digits = 3)
topvals <- topTable(efit, number = 50)
topvals

## ----echo=TRUE, eval=TRUE------------------------------------------------
plot(efit$coef, efit$lods, pch = 16, cex = 0.2, xlab = "log(fold change)",
    ylab = "log(odds)")
ord <- order(efit$lods, decreasing = TRUE)
top8 <- ord[1:8]
text(efit$coef[top8], efit$lods[top8], labels = coralRG$genes[top8,
    "Name"], cex = 0.8, col = "blue")

## ----prior02, eval=FALSE-------------------------------------------------
#  efit.02 <- eBayes(fit, prop=0.02)
#  topTable(efit.02, number = 50)

## ----prior01, eval=FALSE-------------------------------------------------
#  efit.1 <- eBayes(fit, prop=0.1)
#  B.1 <- topTable(efit.1, number = 3072)$B
#  B.01 <- topvals$B
#  points(B.01, B.1, col="gray")

## ----echo=TRUE, eval=TRUE, results="hide"--------------------------------
coral2RG <- read.maimages(targets$FileName,
                         source = "spot",
                         path=path2data,
                         wt.fun=wtarea(100))
coral2RG$genes <- readGAL(path=path2data)
coral2RG$printer <- getLayout(coral2RG$genes)

## ----echo=TRUE, eval=TRUE------------------------------------------------
MA2 <- normalizeWithinArrays(coral2RG, method = "printtiploess")
plotPrintTipLoess(MA2)

## ----echo=TRUE, eval=TRUE------------------------------------------------
boxplot(MA2$M ~ col(MA2$M), names = colnames(MA2$M))
nMA2 <- normalizeBetweenArrays(MA2)
boxplot(nMA2$M ~ col(nMA2$M), names = colnames(nMA2$M))

## ----echo=TRUE, eval=TRUE------------------------------------------------
imageplot(nMA2$M[,5], layout=coral2RG$printer)

## ----echo=TRUE, eval=TRUE------------------------------------------------
design <- c(-1, 1, -1, 1, 0, 1)
fit2 <- lmFit(nMA2, design)

## ----echo=TRUE, eval=TRUE------------------------------------------------
efit2 <- eBayes(fit2)
qqt(efit2$t, df = efit2$df.prior + efit2$df.residual, pch = 16,
    cex = 0.2)

## ----echo=TRUE, eval=TRUE, results="hide"--------------------------------
options(digits = 3)
topTable(efit2, number = 50)

## ----echo=TRUE, eval=TRUE, results="hide"--------------------------------
## Get & store results with & without weights
topvals2 <- topTable(efit2, number = 50)
cbind(row.names(topvals), row.names(topvals2))

## ----echo=TRUE, eval=TRUE, results="hide"--------------------------------
sum(row.names(topvals)%in%row.names(topvals2))

## ----echo=TRUE, eval=TRUE------------------------------------------------
imgplot(coralRG$R[, 1], layout = coralRG$printer)

## ----process-Rnw, eval=FALSE---------------------------------------------
#  library(knitr)
#  knit("marray-notes.Rnw")

