library(GSSE)


### Name: test_stat
### Title: Kolmogorov-Smirnov Test Statistic
### Aliases: test_stat

### ** Examples


 X = seq(0.01, 1, 0.05);
 Func_1 = function(x){ x + runif(length(x), min=0, max=1) };
 Func_2 = function(x){ x + 2*runif(length(x), min=0, max=1) };
 
 U1 = Func_1(X);
 U2 = Func_2(X);
 
 test_stat (F1 = U1, F2 = U2);




