library(DIFlasso)


### Name: refitDIFlasso
### Title: Refit Function for DIFlasso
### Aliases: refitDIFlasso
### Keywords: DIFlasso

### ** Examples

## Not run: 
##D data(simul.data)
##D 
##D Y <- simul.data[,1:10]
##D X <- simul.data[,11:13]
##D 
##D m1 <- DIFlasso(Y = Y, X = X, trace = TRUE) 
##D print(m1)
##D plot(m1)
##D 
##D m2 <- refitDIFlasso(m1)
##D print(m2)
##D plot(m2)
## End(Not run)



