library(GeomComb)


### Name: comb_EIG3
### Title: Trimmed Eigenvector Forecast Combination
### Aliases: comb_EIG3
### Keywords: models

### ** Examples

obs <- rnorm(100)
preds <- matrix(rnorm(1000, 1), 100, 10)
train_o<-obs[1:80]
train_p<-preds[1:80,]
test_o<-obs[81:100]
test_p<-preds[81:100,]

## Number of retained models selected by the user:
data<-foreccomb(train_o, train_p, test_o, test_p)
comb_EIG3(data, ntop_pred = 2, criterion = NULL)

## Number of retained models selected by algorithm:
data<-foreccomb(train_o, train_p, test_o, test_p)
comb_EIG3(data, ntop_pred = NULL, criterion = "RMSE")




