library(GPLTR)


### Name: predict_bagg.pltr
### Title: prediction on new features
### Aliases: predict_bagg.pltr
### Keywords: documentation Machine Learning

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
##D ## Use the bagging procedure to predict new features
##D 
##D # ?predict_bagg.pltr
##D 
##D  Pred_Bag.burn <- predict_bagg.pltr(Bag.burn, Y.name, newdata = burn, 
##D                 type = "response", thresshold = seq(0, 1, by = 0.1))
##D 
##D ## The confusion matrix for each thresshold value using the majority vote
##D 
##D Pred_Bag.burn$CONF1
## End(Not run)



