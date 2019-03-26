library(SCGLR)


### Name: multivariateFormula
### Title: Formula construction
### Aliases: multivariateFormula

### ** Examples

## Not run: 
##D # build multivariate formula
##D ny <- c("y1","y2")
##D nx1 <- c("x11","x12")
##D nx2 <- c("x21","x22")
##D nadd <- c("add1","add2")
##D form <- multivariateFormula(ny,nx1,nx2,nadd,additional=T)
##D form2 <- multivariateFormula(ny,list(nx1,nx2,nadd),additional=T)
##D form3 <- multivariateFormula(ny,list(nx1,nx2),A=nadd)
##D form4 <- multivariateFormula(y1+y2~x11+x12|x21+x22||add1+add2)
##D # Print formulas
##D form
##D form2
##D form3
## End(Not run)



