library(GeomComb)


### Name: summary.foreccomb_res
### Title: Summary of Forecast Combination
### Aliases: print.foreccomb_res_summary summary.foreccomb_res

### ** Examples

obs <- rnorm(100)
preds <- matrix(rnorm(1000, 1), 100, 10)
train_o<-obs[1:80]
train_p<-preds[1:80,]
test_o<-obs[81:100]
test_p<-preds[81:100,]

data<-foreccomb(train_o, train_p, test_o, test_p)
fit<-comb_BG(data)
summary(fit)




