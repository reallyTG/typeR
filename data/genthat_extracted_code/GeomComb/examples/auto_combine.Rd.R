library(GeomComb)


### Name: auto_combine
### Title: Automated Forecast Combination
### Aliases: auto_combine
### Keywords: optimize

### ** Examples

obs <- rnorm(100)
preds <- matrix(rnorm(1000, 1), 100, 10)
train_o<-obs[1:80]
train_p<-preds[1:80,]
test_o<-obs[81:100]
test_p<-preds[81:100,]

data<-foreccomb(train_o, train_p, test_o, test_p)

# Evaluating all the forecast combination methods and returning the best.
# If necessary, it uses the built-in automated parameter optimisation methods
# for the different methods.
best_combination<-auto_combine(data, criterion = "MAPE")

# Same as above, but now we restrict the parameter ntop_pred for the method comb_EIG3 to be 3.
param_list<-list()
param_list$comb_EIG3$ntop_pred<-3
best_combination_restricted<-auto_combine(data, criterion = "MAPE", param_list = param_list)




