library(tmod)


### Name: tmodUtest
### Title: Perform a statistical test of module expression
### Aliases: tmodUtest tmodGeneSetTest tmodCERNOtest tmodPLAGEtest
###   tmodZtest tmodWZtest tmodHGtest

### ** Examples

data(tmod)
fg <- tmod$MODULES2GENES[["LI.M127"]]
bg <- tmod$GENES$ID
result <- tmodHGtest( fg, bg )

## A more sophisticated example
## Gene set enrichment in TB patients compared to 
## healthy controls (Egambia data set)

data(Egambia)
  design <- cbind(Intercept=rep(1, 30), TB=rep(c(0,1), each= 15))
  if(require(limma)) {
  fit <- eBayes( lmFit(Egambia[,-c(1:3)], design))
  tt <- topTable(fit, coef=2, number=Inf, genelist=Egambia[,1:3] )
  tmodUtest(tt$GENE_SYMBOL)
}



