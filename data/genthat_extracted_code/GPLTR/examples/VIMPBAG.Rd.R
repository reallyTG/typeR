library(GPLTR)


### Name: VIMPBAG
### Title: score of importance for variables
### Aliases: VIMPBAG
### Keywords: documentation Machine Learning variable selection

### ** Examples

## Not run: 
##D ## load the data set
##D 
##D  data(burn)
##D 
##D ## set the parameters 
##D 
##D  args.rpart <- list(minbucket = 10, maxdepth = 4, cp = 0, maxsurrogate = 0)
##D  family <- "binomial"
##D  Y.name <- "D2"
##D  X.names <- "Z2"
##D  G.names <- c('Z1','Z3','Z4','Z5','Z6','Z7','Z8','Z9','Z10','Z11')
##D  args.parallel = list(numWorkers = 1)
##D                      
##D ## Bagging a set of basic unprunned pltr predictors
##D 
##D  Bag.burn <-  bagging.pltr(burn, Y.name, X.names, G.names, family, 
##D              args.rpart,epsi = 0.01, iterMax = 4, iterMin = 3, 
##D              Bag = 20, verbose = FALSE, doprune = FALSE)
##D 
##D ## Several importance scores for variables, using the bagging procedure
##D 
##D  Var_Imp_BAG.burn <- VIMPBAG(Bag.burn, burn, Y.name)
##D 
##D ## Importance score using the permutaion method for each thresshold value
##D 
##D  Var_Imp_BAG.burn$PIS
##D  
##D ## Importance score using the deviance criterion
##D 
##D  Var_Imp_BAG.burn$DIS
##D  
## End(Not run)




