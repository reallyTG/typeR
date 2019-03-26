library(recosystem)


### Name: predict
### Title: Recommender Model Predictions
### Aliases: predict

### ** Examples

## Not run: 
##D train_file = data_file(system.file("dat", "smalltrain.txt", package = "recosystem"))
##D test_file = data_file(system.file("dat", "smalltest.txt", package = "recosystem"))
##D r = Reco()
##D set.seed(123) # This is a randomized algorithm
##D opts_tune = r$tune(train_file)$min
##D r$train(train_file, opts = opts_tune)
##D 
##D ## Write predicted values into file
##D out_pred = out_file(tempfile())
##D r$predict(test_file, out_pred)
##D 
##D ## Return predicted values in memory
##D pred = r$predict(test_file, out_memory())
##D 
##D ## If testing data are stored in memory
##D test_df = read.table(test_file@source, sep = " ", header = FALSE)
##D pred2 = r$predict(data_memory(test_df[, 1], test_df[, 2]), out_memory())
##D 
##D ## Compare results
##D print(scan(out_pred@dest, n = 10))
##D head(pred, 10)
##D head(pred2, 10)
## End(Not run)




