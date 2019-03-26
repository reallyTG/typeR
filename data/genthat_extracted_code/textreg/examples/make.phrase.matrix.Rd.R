library(textreg)


### Name: make.phrase.matrix
### Title: Make a table of where phrases appear in a corpus
### Aliases: make.phrase.matrix

### ** Examples

library( tm )
data( bathtub )
lbl = meta( bathtub )$meth.chl
head( make.phrase.matrix( c("bathtub","strip+", "vapor *"), bathtub ) )



