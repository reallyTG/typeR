library(plsVarSel)


### Name: truncation
### Title: Trunction PLS
### Aliases: truncation

### ** Examples

data(yarn, package = "pls")
tr <- truncation(density ~ NIR, ncomp=5, data=yarn, validation="CV",
 truncation="Lenth", trunc.width=0.95) # Default truncation
summary(tr)




