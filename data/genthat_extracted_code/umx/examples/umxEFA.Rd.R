library(umx)


### Name: umxEFA
### Title: FIML-based Exploratory Factor Analysis (EFA)
### Aliases: umxEFA umxFactanal

### ** Examples

## Not run: 
##D myVars <- c("mpg", "disp", "hp", "wt", "qsec")
##D m1 = umxEFA(mtcars[, myVars], factors =   2, rotation = "promax")
##D loadings(m1)
##D 
##D # Formula interface in base-R factanal()
##D m2 = factanal(~ mpg + disp + hp + wt + qsec, factors = 2, rotation = "promax", data = mtcars)
##D loadings(m2)
##D plot(m2)
##D 
##D # Return a loadings object
##D x = umxEFA(mtcars[, myVars], factors = 2, return = "loadings")
##D names(x)
##D 
##D m1 = umxEFA(myVars, factors = 2, data = mtcars, rotation = "promax")
##D m1 = umxEFA(name = "named", factors = "g", data = mtcars[, myVars])
##D m1 = umxEFA(name = "by_number", factors = 2, rotation = "promax", data = mtcars[, myVars])
##D x = umxEFA(name = "score", factors = "g", data = mtcars[, myVars], scores= "Regression")
## End(Not run)



