library(survMisc)


### Name: print
### Title: 'print' methods
### Aliases: print print.ten print.COV print.lrt print.sup
###   print.tableAndPlot print.stratTableAndPlot

### ** Examples

set.seed(1)
(x <- data.table::data.table(matrix(rnorm(1800), ncol=15, nrow=120)))
data.table::setattr(x, "class", c("ten", class(x)))
p1 <- print(x)
stopifnot(is.null(p1))
x[1:80, ]
x[0, ]
(data.table::set(x, j=seq.int(ncol(x)), value=NULL))




