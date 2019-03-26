library(ForecastComb)


### Name: comb_WA
### Title: Winsorized Mean Forecast Combination
### Aliases: comb_WA
### Keywords: models

### ** Examples

obs <- rnorm(100)
preds <- matrix(rnorm(1000, 1), 100, 10)
train_o<-obs[1:80]
train_p<-preds[1:80,]
test_o<-obs[81:100]
test_p<-preds[81:100,]

## User-selected trim factor:
data<-foreccomb(train_o, train_p, test_o, test_p)
comb_TA(data, trim_factor=0.1)

## Algorithm-optimized trim factor:
data<-foreccomb(train_o, train_p, test_o, test_p)
comb_TA(data, criterion="RMSE")




