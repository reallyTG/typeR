library(xtable)


### Name: xtableFtable
### Title: Create and Export Flat Tables
### Aliases: xtableFtable print.xtableFtable
### Keywords: category print

### ** Examples

data(mtcars)
mtcars$cyl <- factor(mtcars$cyl, levels = c("4","6","8"),
                     labels = c("four","six","eight"))
tbl <- ftable(mtcars$cyl, mtcars$vs, mtcars$am, mtcars$gear,
              row.vars = c(2, 4),
              dnn = c("Cylinders", "V/S", "Transmission", "Gears"))
xftbl <- xtableFtable(tbl, method = "compact")
print.xtableFtable(xftbl, booktabs = TRUE)
xftbl <- xtableFtable(tbl, method = "row.compact")
print.xtableFtable(xftbl, rotate.colnames = TRUE,
                   rotate.rownames = TRUE)



