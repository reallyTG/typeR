library(VAR.etp)


### Name: PR.order
### Title: Improved Augmented Regression Method for Predictive Regression
### Aliases: PR.order
### Keywords: ts

### ** Examples


data(data1)
# Replicating Table 5 (excess return)
y=data1$ret.nyse.vw*100 -data1$tbill*100
x=cbind(log(data1$dy.nyse), data1$tbill*100); k=ncol(x) 

p=PR.order(x,y,pmax=10)$p.bic;  # AR(1) 



