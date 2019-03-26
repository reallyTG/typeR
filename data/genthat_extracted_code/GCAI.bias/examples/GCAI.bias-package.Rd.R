library(GCAI.bias)


### Name: GCAI.bias-package
### Title: Guided Correction Approach for Inherited bias (GCAI.bias)
### Aliases: GCAI.bias-package GCAI.bias
### Keywords: package RNA-seq bias Spike-in

### ** Examples


#initialize index matrix
word<-81
word.vec<-c("A","T","C","G")
pos.vec<-c((-(word-1)/2):((word-1)/2))

obj.index<-index.mat.generation(word.vec,pos.vec)

#train

data(train.dat.seq)
data(train.dat.counts)

train.index<-index.preprocess(train.dat.seq,word)
obj.train<-counts.preprocess(train.dat.counts)
obj.train[["index"]]<-train.index

coe.lm<-lm.estimate(obj.train,fit.cut.train=5)

coeplot(coe.lm,obj.index)

#test,correct

data(test.dat.seq)
data(test.dat.counts)

test.index<-index.preprocess(test.dat.seq,word)
obj.test<-counts.preprocess(test.dat.counts)
obj.test[["index"]]<-test.index

test.corrected<-correct.guided(coe.lm,obj.test)

corplot(test.corrected)
posplot(test.corrected,obj.test$pos)



