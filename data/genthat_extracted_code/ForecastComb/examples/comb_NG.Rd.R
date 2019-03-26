library(ForecastComb)


### Name: comb_NG
### Title: Newbold/Granger (1974) Forecast Combination
### Aliases: comb_NG
### Keywords: models

### ** Examples

obs <- rnorm(100)
preds <- matrix(rnorm(1000, 1), 100, 10)
train_o<-obs[1:80]
train_p<-preds[1:80,]
test_o<-obs[81:100]
test_p<-preds[81:100,]

data<-foreccomb(train_o, train_p, test_o, test_p)
comb_NG(data)




