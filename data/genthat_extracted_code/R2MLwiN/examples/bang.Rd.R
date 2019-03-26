library(R2MLwiN)


### Name: bang
### Title: Sub-sample from the 1989 Bangladesh Fertility Survey (see Huq &
###   Cleveland, 1990)
### Aliases: bang
### Keywords: datasets

### ** Examples

## Not run: 
##D 
##D data(bang, package = "R2MLwiN")
##D 
##D bang$use4 <- relevel(bang$use4, 4)
##D 
##D (mymodel <- runMLwiN(log(use4, cons) ~ 1 + lc + (1 | district), 
##D   D = "Unordered Multinomial", estoptions = list(EstM = 1, nonlinear = c(1, 2)), data = bang))
##D 
## End(Not run)



