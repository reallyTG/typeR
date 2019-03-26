library(memisc)


### Name: toLatex
### Title: Additional Methods for LaTeX Representations for R objects
### Aliases: toLatex.default toLatex.ftable toLatex.matrix
###   toLatex.data.frame toLatex.ftable_matrix
### Keywords: misc

### ** Examples

toLatex(diag(5))

toLatex(ftable(UCBAdmissions))

toLatex(rbind(
  ftable(margin.table(UCBAdmissions,c(2,1))),
  ftable(margin.table(UCBAdmissions,c(3,1)))
))



