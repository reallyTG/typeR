library(difNLR)


### Name: startNLR
### Title: Calculates starting values for Non-Linear Regression DIF models.
### Aliases: startNLR

### ** Examples

## Not run: 
##D # loading data based on GMAT
##D data(GMAT)
##D 
##D Data  <- GMAT[, 1:20]
##D group <- GMAT[, "group"]
##D 
##D # starting values for 3PL model
##D startNLR(Data, group, model = "3PL")
##D 
##D # starting values for 3PL model
##D # simplified into single table
##D startNLR(Data, group, model = "3PL", simplify = T)
##D 
##D # starting values for 3PL model
##D # with score as matching criterion
##D startNLR(Data, group, model = "3PL", match = "score")
##D 
##D # starting values for model specified for each item
##D startNLR(Data, group,
##D          model = c(rep("1PL", 5), rep("2PL", 5),
##D                    rep("3PL", 5), rep("4PL", 5)))
##D 
## End(Not run)



