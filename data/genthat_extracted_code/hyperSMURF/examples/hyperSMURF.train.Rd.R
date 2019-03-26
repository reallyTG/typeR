library(hyperSMURF)


### Name: hyperSMURF.train
### Title: hyperSMURF training
### Aliases: hyperSMURF.train

### ** Examples

train <- imbalanced.data.generator(n.pos=20, n.neg=1000, 
          n.features=10, n.inf.features=2, sd=1, seed=1);
HSmodel <- hyperSMURF.train(train$data, train$label, n.part = 5, fp = 1, ratio = 2);



