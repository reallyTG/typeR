library(DatAssim)


### Name: datassim
### Title: Data Assimilation
### Aliases: datassim

### ** Examples

Pred1 = rnorm(10, mean = 50, sd = 100);
Pred2 = rnorm(10, mean = 50, sd = 30);
Pred3 = rnorm(10, mean = 50, sd = 80);
Pred4 = rnorm(10, mean = 50, sd = 100);
# Predictions based on ten observations, at four different time points
Prediction = cbind(Pred1, Pred2, Pred3, Pred4); 
Var1 = matrix(10000, 10);
Var2 = matrix(900, 10);
Var3 = matrix(1600, 10);
Var4 = matrix(10000, 10);
# Corresponding prediction variances
Variance = cbind(Var1, Var2, Var3, Var4);
# Corr = 0 by default
datassim(X = Prediction, Var = Variance);
# Corr = 0.5
datassim(Prediction, Variance, 0.5); 
Corr = cor(Prediction);
datassim(Prediction, Variance, Corr);



