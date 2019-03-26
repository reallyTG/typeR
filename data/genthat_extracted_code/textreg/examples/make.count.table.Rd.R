library(textreg)


### Name: make.count.table
### Title: Count number of times documents have a given phrase.
### Aliases: make.count.table

### ** Examples

library( tm )
data( bathtub )
lbl = meta( bathtub )$meth.chl
make.count.table( c("bathtub","strip+", "vapor *"), lbl, bathtub )



