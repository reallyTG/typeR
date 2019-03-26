## ------------------------------------------------------------------------
library(recosystem)
set.seed(123) # This is a randomized algorithm
train_set = data_file(system.file("dat", "smalltrain.txt", package = "recosystem"))
test_set  = data_file(system.file("dat", "smalltest.txt",  package = "recosystem"))
r = Reco()
opts = r$tune(train_set, opts = list(dim = c(10, 20, 30), lrate = c(0.1, 0.2),
                                     costp_l1 = 0, costq_l1 = 0,
                                     nthread = 1, niter = 10))
opts
r$train(train_set, opts = c(opts$min, nthread = 1, niter = 20))

## Write predictions to file
pred_file = tempfile()
r$predict(test_set, out_file(pred_file))
print(scan(pred_file, n = 10))

## Or, directly return an R vector
pred_rvec = r$predict(test_set, out_memory())
head(pred_rvec, 10)

