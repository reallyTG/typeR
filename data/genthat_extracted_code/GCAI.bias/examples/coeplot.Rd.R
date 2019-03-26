library(GCAI.bias)


### Name: coeplot
### Title: Estimated Coefficients Visualization
### Aliases: coeplot
### Keywords: visualization

### ** Examples

word<-81

data(obj.index)
data(train.dat.seq)
data(train.dat.counts)

train.index<-index.preprocess(train.dat.seq,word)
obj.train<-counts.preprocess(train.dat.counts)
obj.train[["index"]]<-train.index

coe.lm<-lm.estimate(obj.train,fit.cut.train=5)

coeplot(coe.lm,obj.index)



