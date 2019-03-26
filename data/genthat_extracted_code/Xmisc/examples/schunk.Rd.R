library(Xmisc)


### Name: schunk
### Title: Chunk a string into parts
### Aliases: schunk

### ** Examples

x <- 'The quick brown fox jumps over the lazy dog.'
cat(schunk(x,15),'\n')
cat(schunk(x,15,indent.width1=4),'\n') # indent all lines
cat(schunk(x,15,indent.width=4),'\n')  # indent lines other than the first
x <- 'The word, honorificabilitudinita, occurs in Shakespeare\'s
play Love\'s Labour\'s Lost, and means "with honorablenesses".'
cat(schunk(x,30),'\n')
## The word, honorificabilitudini-
## ta, occurs in Shakespeare's
## play Love's Labour's Lost, and
##  means "with honorablenesses".



