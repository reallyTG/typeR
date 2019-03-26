library(CorReg)


### Name: readZ
### Title: read the structure and explain it
### Aliases: readZ

### ** Examples

## Not run: 
##D 
##D data<-mtcars
##D #we first search a sub-regression structure
##D res=structureFinder(X = data,nbini = 30,verbose=0)
##D #then we can try to interpret it
##D readZ(Z = res$Z_opt,crit = "R2",output = "all",X = data)
##D #each component is a sub-regression
##D #First line : The adjusted R-squared is given
##D #Second line : the name of the covariate that is regressed by others
##D #other lines : Coefficients of sub-regression and name of the associated covariate
## End(Not run)



