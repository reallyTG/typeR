library(recosystem)


### Name: train
### Title: Training a Recommender Model
### Aliases: train

### ** Examples

## Training model from a data file
train_set = system.file("dat", "smalltrain.txt", package = "recosystem")
r = Reco()
set.seed(123) # This is a randomized algorithm
r$train(data_file(train_set),
        opts = list(dim = 20, costp_l2 = 0.01, costq_l2 = 0.01, nthread = 1)
)

## Training model from data in memory
train_df = read.table(train_set, sep = " ", header = FALSE)
set.seed(123)
r$train(data_memory(train_df[, 1], train_df[, 2], train_df[, 3]),
        opts = list(dim = 20, costp_l2 = 0.01, costq_l2 = 0.01, nthread = 1)
)




