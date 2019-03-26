library(GCAI.bias)


### Name: corplot
### Title: Pairwise Correlation Calculation and Visualization
### Aliases: corplot
### Keywords: visualization

### ** Examples

word<-81

data(obj.index)
data(train.dat.seq)
data(train.dat.counts)
data(test.dat.seq)
data(test.dat.counts)

#train

train.index<-index.preprocess(train.dat.seq,word)
obj.train<-counts.preprocess(train.dat.counts)
obj.train[["index"]]<-train.index

coe.lm<-lm.estimate(obj.train,fit.cut.train=5)

#test

test.index<-index.preprocess(test.dat.seq,word)
obj.test<-counts.preprocess(test.dat.counts)
obj.test[["index"]]<-test.index

test.corrected<-correct.guided(coe.lm,obj.test)

corplot(test.corrected)



