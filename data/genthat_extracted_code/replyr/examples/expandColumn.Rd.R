library(replyr)


### Name: expandColumn
### Title: Expand a column of vectors into one row per value of each
###   vector.
### Aliases: expandColumn

### ** Examples



d <- data.frame(name= c('a','b'))
d$value <- list(c('x','y'),'z')
expandColumn(d, 'value',
             rowidDest= 'origRowId',
             idxDest= 'valueIndex')





