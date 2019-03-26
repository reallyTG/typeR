library(cubfits)


### Name: Estimate Phi
### Title: Initialization of Phi (Generic)
### Aliases: estimatePhi
### Keywords: tool

### ** Examples

## Not run: 
##D suppressMessages(library(cubfits, quietly = TRUE))
##D set.seed(1234)
##D 
##D # Convert data.
##D reu13.list <- convert.reu13.df.to.list(ex.test$reu13.df)
##D y.list <- convert.y.to.list(ex.test$y)
##D n.list <- convert.n.to.list(ex.test$n)
##D 
##D # Get phi.pred.Init
##D init.function(model = "roc")
##D fitlist <- fitMultinom(ex.train$reu13.df, ex.train$phi.Obs, ex.train$y, ex.train$n)
##D phi.pred.Init <- estimatePhi(fitlist, reu13.list, y.list, n.list,
##D                          E.Phi = median(ex.test$phi.Obs),
##D                          lower.optim = min(ex.test$phi.Obs) * 0.9,
##D                          upper.optim = max(ex.test$phi.Obs) * 1.1)
## End(Not run)



