library(APPEstimation)


### Name: appe.glm
### Title: C-statistics adjusted for predictor distributions
### Aliases: appe.glm

### ** Examples

set.seed(100)

# generating learning data
n0  = 100
Z   = cbind(rbeta(n0, 5, 5), rbeta(n0, 5, 5))
Y   = apply(Z, 1, function (xx) {
        rbinom(1, 1, (1/(1+exp(-(sum(c(-2,2,2) * c(1,xx)))))))})
dat = data.frame(Y=Y, Za=Z[,1], Zb=Z[,2])

# the model to be evaluated
mdl = glm(Y~., binomial, data=dat)

# validation dataset, with different centers on predictors
n1   = 100
Z1   = cbind(rbeta(n1, 6, 4), rbeta(n1, 6, 4))
Y1   = apply(Z1, 1, function (xx) {
         rbinom(1, 1, (1/(1+exp(-(sum(c(-2,2,2) * c(1,xx)))))))})
dat1 = data.frame(Y=Y1, Za=Z1[,1], Zb=Z1[,2])

# calculation of L1 and L2 for this model
appe.glm(mdl, dat, dat1, reps=0)



