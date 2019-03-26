library(RcppDL)


### Name: deeplearning-methods
### Title: Create 'deeplearning' objects from training set.
### Aliases: Rda Rsda Rrbm Rdbn train pretrain finetune predict reconstruct

### ** Examples

 data(test)
 dbn_test <- Rdbn(train_X, train_Y, hidden)
 summary(dbn_test)
 LearningRate(dbn_test)
 pretrain(dbn_test)
 finetune(dbn_test)
 predict(dbn_test, test_X)



