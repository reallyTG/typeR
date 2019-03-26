library(funchir)


### Name: funchir-table
### Title: Convenient Wrappers for creating and printing tables
### Aliases: table2 lyx.xtable lyx.texreg sanitize2

### ** Examples

  x <- sample(10, size = 100, replace = TRUE)
  y <- sample(3, size = 100, replace = TRUE)
  tbl <- table2(x, y, prop = TRUE, margin = 1)
  table2(x, ord = "dec")
  table2(y, ord = TRUE)
  table2(y, dig = -1L)
  
  ## Not run: 
##D     lyx.xtable(xtable(tbl), sanitize.text.function = sanitize2)
##D   
## End(Not run)



