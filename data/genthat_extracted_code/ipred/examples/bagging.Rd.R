library(ipred)


### Name: bagging
### Title: Bagging Classification, Regression and Survival Trees
### Aliases: bagging ipredbagg ipredbagg.factor ipredbagg.integer
###   ipredbagg.numeric ipredbagg.Surv ipredbagg.default bagging.data.frame
###   bagging.default
### Keywords: tree

### ** Examples


library("MASS")
library("survival")

# Classification: Breast Cancer data

data("BreastCancer", package = "mlbench")

# Test set error bagging (nbagg = 50): 3.7% (Breiman, 1998, Table 5)

mod <- bagging(Class ~ Cl.thickness + Cell.size
                + Cell.shape + Marg.adhesion   
                + Epith.c.size + Bare.nuclei   
                + Bl.cromatin + Normal.nucleoli
                + Mitoses, data=BreastCancer, coob=TRUE)
print(mod)

# Test set error bagging (nbagg=50): 7.9% (Breiman, 1996a, Table 2)
data("Ionosphere", package = "mlbench")
Ionosphere$V2 <- NULL # constant within groups

bagging(Class ~ ., data=Ionosphere, coob=TRUE)

# Double-Bagging: combine LDA and classification trees

# predict returns the linear discriminant values, i.e. linear combinations
# of the original predictors

comb.lda <- list(list(model=lda, predict=function(obj, newdata)
                                 predict(obj, newdata)$x))

# Note: out-of-bag estimator is not available in this situation, use
# errorest

mod <- bagging(Class ~ ., data=Ionosphere, comb=comb.lda) 

predict(mod, Ionosphere[1:10,])

# Regression:

data("BostonHousing", package = "mlbench")

# Test set error (nbagg=25, trees pruned): 3.41 (Breiman, 1996a, Table 8)

mod <- bagging(medv ~ ., data=BostonHousing, coob=TRUE)
print(mod)

library("mlbench")
learn <- as.data.frame(mlbench.friedman1(200))

# Test set error (nbagg=25, trees pruned): 2.47 (Breiman, 1996a, Table 8)

mod <- bagging(y ~ ., data=learn, coob=TRUE)
print(mod)

# Survival data

# Brier score for censored data estimated by 
# 10 times 10-fold cross-validation: 0.2 (Hothorn et al,
# 2002)

data("DLBCL", package = "ipred")
mod <- bagging(Surv(time,cens) ~ MGEc.1 + MGEc.2 + MGEc.3 + MGEc.4 + MGEc.5 +
                                 MGEc.6 + MGEc.7 + MGEc.8 + MGEc.9 +
                                 MGEc.10 + IPI, data=DLBCL, coob=TRUE)

print(mod)





