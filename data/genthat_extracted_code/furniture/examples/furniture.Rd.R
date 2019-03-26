library(furniture)


### Name: furniture
### Title: furniture
### Aliases: furniture furniture-package

### ** Examples

## Not run: 
##D 
##D library(furniture)
##D 
##D ## Table 1
##D data %>%
##D   table1(var1, var2, var3, 
##D          splitby = ~groupvar,
##D          test = TRUE)
##D 
##D ## Table F
##D data %>%
##D   tableF(var1)
##D 
##D ## Washer
##D x = washer(x, 7, 8, 9)
##D x = washer(x, is.na, value=0)
##D 
##D ## Crosstabs Operator
##D f1 %xt% f2
##D 
## End(Not run)




