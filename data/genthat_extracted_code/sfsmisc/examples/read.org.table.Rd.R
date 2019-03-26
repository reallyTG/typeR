library(sfsmisc)


### Name: read.org.table
### Title: Read.table for an Emacs Org Table
### Aliases: read.org.table
### Keywords: file utilities

### ** Examples

t1 <-
"
| a | var2 |   C |
|---+------+-----|
| 2 | may  | 3.4 |
| 7 | feb  | 4.7 |
"
d <- read.org.table(text = t1)
d
stopifnot(dim(d) == c(2, 3),
          identical(names(d), c("a", "var2", "C")),
          d[,"a"] == c(2,7))



