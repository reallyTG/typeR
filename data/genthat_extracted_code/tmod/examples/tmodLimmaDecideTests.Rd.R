library(tmod)


### Name: tmodLimmaDecideTests
### Title: Up- and down-regulated genes in modules based on limma object
### Aliases: tmodLimmaDecideTests

### ** Examples

data(Egambia)
design <- cbind(Intercept=rep(1, 30), TB=rep(c(0,1), each= 15))
if(require(limma)) {
  fit <- eBayes( lmFit(Egambia[,-c(1:3)], design))
  ret <- tmodLimmaTest(fit, Egambia$GENE_SYMBOL)
  pie <- tmodLimmaDecideTests(fit, Egambia$GENE_SYMBOL)
  tmodPanelPlot(ret, pie=pie)
}



