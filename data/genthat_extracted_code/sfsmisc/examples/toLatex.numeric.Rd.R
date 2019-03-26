library(sfsmisc)


### Name: toLatex.numeric
### Title: LaTeX or Sweave friendly Formatting of Numbers
### Aliases: toLatex.numeric
### Keywords: misc

### ** Examples

xx <- pi * 10^(-9:9)

format(xx)
formatC(xx)

toLatex(xx) #-> scientific = TRUE is chosen
toLatex(xx, scientific=FALSE)

sapply(xx, toLatex)
sapply(xx, toLatex, digits = 2)



