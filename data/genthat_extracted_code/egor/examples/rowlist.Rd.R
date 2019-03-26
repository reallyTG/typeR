library(egor)


### Name: rowlist
### Title: Convert a table to a list of rows
### Aliases: rowlist

### ** Examples


library(tibble)
(df <- tibble(x=2:1, y=list(list(1:3), list(3:4))))
rowlist(df)




