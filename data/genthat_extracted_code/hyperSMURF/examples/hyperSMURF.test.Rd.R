library(hyperSMURF)


### Name: hyperSMURF.test
### Title: Test of a hyperSMURF model
### Aliases: hyperSMURF.test

### ** Examples

train <- imbalanced.data.generator(n.pos=20, n.neg=1000, 
       n.features=10, n.inf.features=2, sd=0.1, seed=1);
HSmodel <- hyperSMURF.train(train$data, train$label, 
               n.part = 5, fp = 1, ratio = 2, k = 5);
test <- imbalanced.data.generator(n.pos=20, n.neg=1000, 
        n.features=10, n.inf.features=2, sd=0.1, seed=2);
res <- hyperSMURF.test(test$data, HSmodel);
y <- ifelse(test$labels==1,1,0);
pred <- ifelse(res>0.5,1,0);
table(pred,y);



