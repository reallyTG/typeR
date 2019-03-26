library(rlist)


### Name: list.parse
### Title: Convert an object to list with identical structure
### Aliases: list.parse list.parse.character list.parse.data.frame
###   list.parse.default list.parse.matrix

### ** Examples

x <- data.frame(a=1:3,type=c('A','C','B'))
list.parse(x)

x <- matrix(rnorm(1000),ncol=5)
rownames(x) <- paste0('item',1:nrow(x))
colnames(x) <- c('a','b','c','d','e')
list.parse(x)

z <- '
a:
  type: x
  class: A
  registered: yes
'
list.parse(z, type='yaml')



