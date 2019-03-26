library(tmod)


### Name: tmodLimmaTest
### Title: Run tmod enrichment tests directly on a limma object
### Aliases: tmodLimmaTest

### ** Examples

data(Egambia)
design <- cbind(Intercept=rep(1, 30), TB=rep(c(0,1), each= 15))
if(require(limma)) {
  fit <- eBayes( lmFit(Egambia[,-c(1:3)], design))
  ret <- tmodLimmaTest(fit, genes=Egambia$GENE_SYMBOL)
  tmodSummary(ret)
  tmodPanelPlot(ret)
}



