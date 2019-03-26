library(simsalapar)


### Name: toLatex-ftable
### Title: Convert Flat Contingency Table (ftable) and VarLists to LaTeX
###   Table
### Aliases: toLatex.ftable toLatex.varlist fftable tablines cattablines
### Keywords: utilities

### ** Examples

## Different table layouts for the same content
(ft1 <- ftable(Titanic, col.vars = 1:4))
(ft2 <- ftable(Titanic, row.vars = 1))
(ft3 <- ftable(Titanic, row.vars = 1:2))
(ft4 <- ftable(Titanic, row.vars = 1:3))
(ft5 <- ftable(Titanic, row.vars = 1:4))

## What tablines() returns
tablines(fftable(ft2))

## LaTeX (booktabs/non-booktabs) versions
toLatex(ft1, do.table=FALSE)
toLatex(ft1, booktabs=FALSE)
toLatex(ft1, method="col.compact")
toLatex(ft1)
toLatex(ft2)
toLatex(ft3)
toLatex(ft4)
toLatex(ft5, booktabs=FALSE)
toLatex(ft5, method="col.compact")
toLatex(ft5)

## ``poor-man's approach'' for creating lines of a LaTeX table
set.seed(271)
tab <- matrix(runif(6), ncol=3)
ftab <- formatC(tab, digits=4, format="f")
cattablines(ftab)
rownames(ftab) <- LETTERS[1:nrow(ftab)]
cattablines(ftab)



