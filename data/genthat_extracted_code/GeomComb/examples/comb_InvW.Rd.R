library(GeomComb)


### Name: comb_InvW
### Title: Inverse Rank Forecast Combination
### Aliases: comb_InvW
### Keywords: models

### ** Examples

obs <- rnorm(100)
preds <- matrix(rnorm(1000, 1), 100, 10)
train_o<-obs[1:80]
train_p<-preds[1:80,]
test_o<-obs[81:100]
test_p<-preds[81:100,]

data<-foreccomb(train_o, train_p, test_o, test_p)
comb_InvW(data)




