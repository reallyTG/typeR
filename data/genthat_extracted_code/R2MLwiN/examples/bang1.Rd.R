library(R2MLwiN)


### Name: bang1
### Title: Sub-sample from the 1989 Bangladesh Fertility Survey
### Aliases: bang1
### Keywords: datasets

### ** Examples

## Not run: 
##D 
##D data(bang1, package = "R2MLwiN")
##D 
##D (mymodel <- runMLwiN(logit(use, denomb) ~ 1 + age + lc + urban + (1 + urban | district),
##D   D = "Binomial", estoptions = list(EstM = 1), data = bang1))
##D 
## End(Not run)



