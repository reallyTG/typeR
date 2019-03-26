library(statmod)


### Name: glmgam.fit
### Title: Fit Generalized Linear Model by Fisher Scoring with Levenberg
###   Damping
### Aliases: glmgam.fit glmnb.fit
### Keywords: regression

### ** Examples

y <- rgamma(10,shape=5)
X <- cbind(1,1:10)
fit <- glmgam.fit(X,y,trace=TRUE)



