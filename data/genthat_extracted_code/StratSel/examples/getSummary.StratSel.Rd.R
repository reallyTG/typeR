library(StratSel)


### Name: getSummary
### Title: getSummary Method for extending mtable()
### Aliases: getSummary.StratSel
### Keywords: LaTeX Make tables

### ** Examples

data(data.fake)
out1 <- StratSel(Y ~ var.A | var.D | var.E , data=data.fake, corr=FALSE)
out2 <- StratSel(Y ~ var.A | var.C | var.E, data=data.fake, corr=FALSE)
mtable(out1,out2)



