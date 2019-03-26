library(cwhmisc)


### Name: tex.table
### Title: Convert a data matrix into LaTeX code.
### Aliases: tex.table tex.tab0
### Keywords: interface

### ** Examples

  m <- matrix(rnorm(100),nrow=10,ncol=10,dimnames=list(LETTERS[1:10],colnames=letters[1:10]))
  tex.table(m,file="tex.table.tex")
# \begin{tabular}{r|rrrrrrrrrr}
# \hline
# & a & b & c & d & e & f & g & h & i & j\ \hline
# A & -0.63 & 1.51 & 0.92 & 1.36 & -0.16 & 0.40 & 2.40 & 0.48 & -0.57 & -0.54\ 
# B & 0.18 & 0.39 & 0.78 & -0.10 & -0.25 & -0.61 & -0.04 & -0.71 & -0.14 & 1.21\ 
# ...



