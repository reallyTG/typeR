library(splitstackshape)


### Name: expandRows
### Title: Expand the Rows of a Dataset
### Aliases: expandRows

### ** Examples


mydf <- data.frame(x = c("a", "b", "q"), 
                   y = c("c", "d", "r"), 
                   count = c(2, 5, 3))
library(data.table)
DT <- as.data.table(mydf)
mydf
expandRows(mydf, "count")
expandRows(DT, "count", drop = FALSE)
expandRows(mydf, count = 3) ## This takes values from the third column!
expandRows(mydf, count = 3, count.is.col = FALSE)
expandRows(mydf, count = c(1, 5, 9), count.is.col = FALSE)
expandRows(DT, count = c(1, 5, 9), count.is.col = FALSE)




