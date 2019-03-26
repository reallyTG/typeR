library(xseq)


### Name: NormExpr
### Title: Remove the cis-effects of copy number alterations on gene
###   expression
### Aliases: NormExpr

### ** Examples

data(cna.logr, expr)
expr.norm = NormExpr(cna.logr, expr, gene="PTEN")



