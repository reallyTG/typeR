library(gencve)


### Name: logloss
### Title: log-loss function for multiclass prediction
### Aliases: logloss

### ** Examples

#logloss for perfect fit
t <- ifelse(runif(50)<0.5, "a", "b")
logloss(y=t, yp=t)



