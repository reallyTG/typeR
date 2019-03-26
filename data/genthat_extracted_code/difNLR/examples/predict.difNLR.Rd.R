library(difNLR)


### Name: predict.difNLR
### Title: Predicted values for difNLR object
### Aliases: predict.difNLR

### ** Examples

## Not run: 
##D # loading data based on GMAT
##D data(GMAT)
##D 
##D Data  <- GMAT[, 1:20]
##D group <- GMAT[, "group"]
##D 
##D # Testing both DIF effects using likelihood-ratio test and
##D # 3PL model with fixed guessing for groups
##D (x <- difNLR(Data, group, focal.name = 1, model = "3PLcg"))
##D 
##D # Predicted values
##D predict(x)
##D predict(x, item = 1)
##D 
##D # Predicted values for new observations
##D predict(x, item = 1, match = 0, group = 1)
##D predict(x, item = 1, match = 0, group = 0)
## End(Not run)



