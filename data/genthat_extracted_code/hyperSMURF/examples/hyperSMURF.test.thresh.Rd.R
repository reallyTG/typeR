library(hyperSMURF)


### Name: hyperSMURF.test.thresh
### Title: Test of a thresholded hyperSMURF model
### Aliases: hyperSMURF.test.thresh

### ** Examples

train <- imbalanced.data.generator(n.pos=20, n.neg=500, 
         n.features=10, n.inf.features=2, sd=0.1, seed=1);
HSmodel <- hyperSMURF.train(train$data, train$label, n.part = 5, 
                  fp = 1, ratio = 2, k = 5, cutoff=c(0.3, 0.7));
test <- imbalanced.data.generator(n.pos=20, n.neg=500, 
         n.features=10, n.inf.features=2, sd=0.1, seed=2);
res <- hyperSMURF.test.thresh(test$data, HSmodel);



