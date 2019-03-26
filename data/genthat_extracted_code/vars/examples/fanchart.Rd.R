library(vars)


### Name: fanchart
### Title: Fanchart plot for objects of class varprd
### Aliases: fanchart
### Keywords: regression

### ** Examples

## Not run: 
##D data(Canada)
##D var.2c <- VAR(Canada, p = 2, type = "const")
##D var.2c.prd <- predict(var.2c, n.ahead = 8, ci = 0.95)
##D fanchart(var.2c.prd)
## End(Not run)



