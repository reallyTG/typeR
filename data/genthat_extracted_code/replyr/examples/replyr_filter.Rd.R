library(replyr)


### Name: replyr_filter
### Title: Filter a tbl on a column having values in a given set.
### Aliases: replyr_filter

### ** Examples


values <- c('a','c')
d <- data.frame(x=c('a','a','b','b','c','c'),y=1:6,
                stringsAsFactors=FALSE)
replyr_filter(d,'x',values)




