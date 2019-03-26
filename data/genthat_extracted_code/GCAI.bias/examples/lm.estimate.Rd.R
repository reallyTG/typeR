library(GCAI.bias)


### Name: lm.estimate
### Title: Linear Model Fitting
### Aliases: lm.estimate
### Keywords: fitting

### ** Examples

word<-81

data(train.dat.seq)
data(train.dat.counts)

train.index<-index.preprocess(train.dat.seq,word)
obj.train<-counts.preprocess(train.dat.counts)
obj.train[["index"]]<-train.index

coe.lm<-lm.estimate(obj.train,fit.cut.train=5)



