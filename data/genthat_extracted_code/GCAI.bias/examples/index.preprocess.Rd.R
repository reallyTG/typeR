library(GCAI.bias)


### Name: index.preprocess
### Title: Binary Index Matrix Generation
### Aliases: index.preprocess
### Keywords: initialization

### ** Examples

word<-81

data(train.dat.seq)
train.index<-index.preprocess(train.dat.seq,word)

data(test.dat.seq)
test.index<-index.preprocess(test.dat.seq,word)



