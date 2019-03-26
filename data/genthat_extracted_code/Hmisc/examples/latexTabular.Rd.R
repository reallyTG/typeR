library(Hmisc)


### Name: latexTabular
### Title: Convert a Data Frame or Matrix to a LaTeX Tabular
### Aliases: latexTabular
### Keywords: utilities interface methods file character manip

### ** Examples

x <- matrix(1:6, nrow=2, dimnames=list(c('a','b'),c('c','d','this that')))
latexTabular(x)   # a character string with LaTeX markup



