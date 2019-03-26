## ---- echo = FALSE-------------------------------------------------------
library(iterpc)

## ------------------------------------------------------------------------
I <- iterpc(5, 2, ordered = TRUE)
getall(I)

## ------------------------------------------------------------------------
I <- iterpc(5, 2, replace = TRUE, ordered = TRUE)
getall(I)

## ------------------------------------------------------------------------
x <- c("a", "a", "b", "c")
I <- iterpc(table(x), 2, ordered = TRUE)
# or I <- iterpc(c(2,1,1), 2, label=c("a", "b", "c"), ordered = TRUE)
getall(I)

## ------------------------------------------------------------------------
x <- c("a", "a", "b", "c")
I <- iterpc(table(x), 2, replace = TRUE, ordered = TRUE)
# or I = iterpc(c(2,1,1), 2, label=c("a", "b", "c"), replace= T RUE, ordered = TRUE)
getall(I)

