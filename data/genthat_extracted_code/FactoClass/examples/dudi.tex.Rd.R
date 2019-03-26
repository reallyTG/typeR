library(FactoClass)


### Name: dudi.tex
### Title: LaTeX Tables of Coordinates and Aids to Interpretation of
###   Principal Axis Methods
### Aliases: dudi.tex latex
### Keywords: multivariate

### ** Examples

data(Bogota)
coa1 <- dudi.coa(Bogota[,2:7], scannf = FALSE)
dudi.tex(coa1,job="Bogota") 



