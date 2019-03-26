library(APPEstimation)


### Name: appe.lm
### Title: L_1 and L_2 errors adjusted for predictor distributions
### Aliases: appe.lm

### ** Examples

set.seed(100)

# generating development data
n0  = 100
Z   = cbind(rbeta(n0, 3, 3), rbeta(n0, 3, 3))
Y   = apply(Z, 1, function(xx) { rlnorm(1, sum(c(1, 1) * xx), 0.3) })
dat = data.frame(Za=Z[,1], Zb=Z[,2], Y=Y)

# the model to be evaluated
mdl = lm(Y~ Za + Zb, data=dat)

# generating validation dataset 
n1   = 100
Z1   = cbind(rbeta(n0, 3.5, 2.5), rbeta(n0, 3.5, 2.5))
Y1   = apply(Z1, 1, function(xx) { rlnorm(1, sum(c(1, 1) * xx), 0.3) })
dat1 = data.frame(Za=Z1[,1], Zb=Z1[,2], Y=Y1)

# calculation of L1 and L2 for this model
appe.lm(mdl, dat, dat1, reps=0)



