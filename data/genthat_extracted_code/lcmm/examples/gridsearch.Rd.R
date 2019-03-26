library(lcmm)


### Name: gridsearch
### Title: Automatic grid search
### Aliases: gridsearch

### ** Examples


## Not run: 
##D # initial model with ng=1 for the random initial values
##D m1 <- hlme(Y ~ Time * X1, random =~ Time, subject = 'ID', ng = 1, 
##D       data = data_hlme)
##D 
##D # gridsearch with 10 iterations from 50 random departures
##D m2d <- gridsearch(rep = 50, maxiter = 10, minit = m1, hlme(Y ~ Time * X1,
##D       mixture =~ Time, random =~ Time, classmb =~ X2 + X3, subject = 'ID',
##D           ng = 2, data = data_hlme))
##D         
## End(Not run)




