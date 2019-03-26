library(hyperSMURF)


### Name: smote
### Title: SMOTE oversampling
### Aliases: smote

### ** Examples

d <- imbalanced.data.generator(n.pos=20, n.neg=1000, n.features=12, n.inf.features=2, sd=1, seed=1);
res <- smote(d$data[d$label==1,],  fp = 2, k = 3);



