library(cwhmisc)


### Name: my.table
### Title: Tabulate data, with extra rows and columns.
### Aliases: my.table.NA my.table.margin
### Keywords: distribution

### ** Examples

  x <- c(1,NA,2,5,-1:7)
  my.table.NA(x)
  f1 <- sample(1:5,100,replace=TRUE) 
  f2 <- sample(1:5,100,replace=TRUE)
  my.table.margin(f1,f2)
  my.table.margin(matrix(1:24,4))



