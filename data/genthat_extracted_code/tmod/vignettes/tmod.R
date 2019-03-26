## ----setup, echo=FALSE, results="hide", include=FALSE--------------------
library(knitr)
opts_chunk$set(cache=FALSE, autodep=TRUE, tidy=FALSE, fig.width=5, warning=FALSE, fig.height=5)
opts_knit$set(width=75)

## ----twoA, size="Huge"---------------------------------------------------
library(limma)
library(tmod)
data(Egambia)
design <- cbind(Intercept=rep(1, 30), TB=rep(c(0,1), each= 15))
E <- as.matrix(Egambia[,-c(1:3)])
fit <- eBayes( lmFit(E, design))
tt <- topTable(fit, coef=2, number=Inf, 
  genelist=Egambia[,1:3] )

## ----mod1----------------------------------------------------------------
fg <- tt$GENE_SYMBOL[tt$adj.P.Val < 0.05 & abs( tt$logFC ) > 1]
res <- tmodHGtest(fg=fg, bg=tt$GENE_SYMBOL)
res

## ----mod2----------------------------------------------------------------
l    <- tt$GENE_SYMBOL
res2 <- tmodUtest(l)
head(res2)
nrow(res2)

## ----fourB---------------------------------------------------------------
l    <- tt$GENE_SYMBOL
res2 <- tmodCERNOtest(l)
head( res2 )

## ----five,fig=TRUE,fig.width=7,fig.height=4------------------------------
evidencePlot(l, "LI.M75")

## ----limma1--------------------------------------------------------------
res.l <- tmodLimmaTest(fit, Egambia$GENE_SYMBOL)
length(res.l)
names(res.l)
head(res.l$TB)

## ----pplot0--------------------------------------------------------------
head(tmodSummary(res.l), 5)

## ----pplot1,fig=TRUE,fig.width=6,fig.height=8----------------------------
tmodPanelPlot(res.l, text.cex=0.8)

## ----pplot3,fig=TRUE,fig.width=5,fig.height=6----------------------------
pie <- tmodLimmaDecideTests(fit, genes=Egambia$GENE_SYMBOL)
tmodPanelPlot(res.l, pie=pie, text.cex=0.8, pie.style="rug")

## ----pplot5--------------------------------------------------------------
tt.I <- 
  topTable(fit, coef="Intercept", number=Inf, sort.by="n")
tt.TB <- topTable(fit, coef="TB", number=Inf, sort.by="n")
pie2 <- tmodDecideTests(Egambia$GENE_SYMBOL,
  lfc=cbind(tt.I$logFC, tt.TB$logFC),
  pval=cbind(tt.I$adj.P.Val, tt.TB$adj.P.Val))
identical(pie[[1]], pie2[[1]])

## ----exmset--------------------------------------------------------------
mymset <- makeTmod(
  modules=data.frame(ID=c("A", "B"),
             Title=c("A title", 
                      "B title")),
  modules2genes=list(
    A=c("G1", "G2"),
    B=c("G3", "G4"))
)
mymset

## ----msigdbparse1,eval=FALSE---------------------------------------------
#  msig <- tmodImportMSigDB("msigdb_v6.1.xml")

## ----msigdb7,eval=FALSE--------------------------------------------------
#  sel <- msig$MODULES$Category == "H"
#  tmodCERNOtest(tt$GENE_SYMBOL, mset=msig[sel] )

