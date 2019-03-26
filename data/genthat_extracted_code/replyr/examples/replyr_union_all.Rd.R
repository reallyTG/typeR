library(replyr)


### Name: replyr_union_all
### Title: Union two tables.
### Aliases: replyr_union_all

### ** Examples


d1 <- data.frame(x = c('a','b'), y = 1, stringsAsFactors= FALSE)
d2 <- data.frame(x = 'c', z = 1, stringsAsFactors= FALSE)
replyr_union_all(d1, d2, useDplyrLocal= FALSE)




