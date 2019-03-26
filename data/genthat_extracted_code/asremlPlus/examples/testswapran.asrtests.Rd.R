library(asremlPlus)


### Name: testswapran.asrtests
### Title: Tests, using a REMLRT, the significance of the difference
###   between current random model and one in which oldterms are dropped
###   and newterms are added.  The result is recorded in a data.frame.
### Aliases: testswapran.asrtests testswapran
### Keywords: asreml htest

### ** Examples
## Not run: 
##D current.asrt <- testswapran(current.asrt, oldterms = "str(~ Cart/xDays, ~us(2):id(184))",
##D                             newterms = "Cart/xDays", pos = FALSE, 
##D                             label = "Intercept/Slope correlation", 
##D                             simpler = TRUE)
##D   print(current.asrt)
## End(Not run)


