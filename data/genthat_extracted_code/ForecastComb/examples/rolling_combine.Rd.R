library(ForecastComb)


### Name: rolling_combine
### Title: Dynamic Forecast Combination
### Aliases: rolling_combine
### Keywords: models

### ** Examples

obs <- rnorm(100)
preds <- matrix(rnorm(1000, 1), 100, 10)
train_o<-obs[1:80]
train_p<-preds[1:80,]
test_o<-obs[81:100]
test_p<-preds[81:100,]

data<-foreccomb(train_o, train_p, test_o, test_p)

#Static forecast combination (for example OLS):
static_OLS <- comb_OLS(data)

#Dynamic forecast combination:
dyn_OLS <- rolling_combine(data, "comb_OLS")




