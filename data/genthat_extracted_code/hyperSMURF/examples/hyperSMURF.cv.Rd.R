library(hyperSMURF)


### Name: hyperSMURF.cv
### Title: hyperSMURF cross-validation
### Aliases: hyperSMURF.cv

### ** Examples

d <- imbalanced.data.generator(n.pos=10, n.neg=300, sd=0.3);
res<-hyperSMURF.cv (d$data, d$labels, kk=2, n.part=3, fp=1, ratio=1, k=3, ntree=7, 
                    mtry=2, seed = 1, fold.partition=NULL);



