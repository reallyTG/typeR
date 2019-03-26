library(recosystem)


### Name: tune
### Title: Tuning Model Parameters
### Aliases: tune

### ** Examples

## Not run: 
##D train_set = system.file("dat", "smalltrain.txt", package = "recosystem")
##D train_src = data_file(train_set)
##D r = Reco()
##D set.seed(123) # This is a randomized algorithm
##D res = r$tune(
##D     train_src,
##D     opts = list(dim = c(10, 20, 30),
##D                 costp_l1 = 0, costq_l1 = 0,
##D                 lrate = c(0.05, 0.1, 0.2), nthread = 2)
##D )
##D r$train(train_src, opts = res$min)
## End(Not run)




