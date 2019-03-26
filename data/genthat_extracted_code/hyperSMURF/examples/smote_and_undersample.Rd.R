library(hyperSMURF)


### Name: smote_and_undersample
### Title: SMOTE oversampling and undersampling
### Aliases: smote_and_undersample

### ** Examples

d <- imbalanced.data.generator(n.pos=20, n.neg=1000, n.features=12, n.inf.features=2, sd=1, seed=1);
res <- smote_and_undersample(d$data, d$label, fp = 2, ratio = 3);



