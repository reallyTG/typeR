library(BTLLasso)


### Name: response.BTLLasso
### Title: Create response object for BTLLasso
### Aliases: response.BTLLasso

### ** Examples


## Not run: 
##D ##############################
##D ##### Example how response object for Bundesliga data Buli1516 was created
##D ##############################
##D 
##D data(BuliResponse)
##D 
##D Y.Buli <- response.BTLLasso(response = BuliResponse$Result, 
##D                             first.object = BuliResponse$TeamHome,
##D                             second.object = BuliResponse$TeamAway,
##D                             subject = BuliResponse$Matchday)
##D 
##D 
##D ##############################
##D ##### Example to create response object from paircomp object
##D ##############################
##D data("Topmodel2007", package = "psychotree")
##D 
##D Y.models <- response.BTLLasso(Topmodel2007$preference)
##D X.models <- scale(model.matrix(preference~., data = Topmodel2007)[,-1])
##D rownames(X.models) <- paste0("Subject",1:nrow(X.models))
##D colnames(X.models) <- c("Gender","Age","KnowShow","WatchShow","WatchFinal")
##D 
##D set.seed(5)
##D m.models <- cv.BTLLasso(Y = Y.models, X = X.models)
## End(Not run)



