library(ODS)


### Name: gcv_ODS
### Title: Generalized cross-validation for ODS data
### Aliases: gcv_ODS

### ** Examples

## No test: 
library(ODS)
# take the example data from the ODS package
# please see the documentation for details about the data set ods_data

nknots = 10
degree = 2

# get the initial value of the parameters from standard linear regression based on SRS data #
dataSRS = ods_data[1:200,]
YS = dataSRS[,1]
XS = dataSRS[,2]
ZS = dataSRS[,3:5]

knots = quantileknots(XS, nknots, 0)
# the power basis spline function
MS = Bfct(as.matrix(XS), degree, knots)
DS = cbind(MS, ZS)
theta00 = as.numeric(lm(YS ~ DS -1)$coefficients)
sig0_sq00 = var(YS - DS %*% theta00)
pi00 = c(0.15, 0.15)
v00 = c(0, 0)
eta00 = matrix(c(theta00, pi00, v00, sig0_sq00), ncol=1)
mu_Y = mean(YS)
sig_Y = sd(YS)

Y = matrix(ods_data[,1])
X = matrix(ods_data[,2])
Z = matrix(ods_data[,3:5], nrow=400)

# In this ODS data, the supplemental samples are taken from (-Infty, mu_Y-a*sig_Y) #
# and (mu_Y+a*sig_Y, +Infty), where a=1 #
n_f = c(200, 100, 100)
Cpt = 1

# GCV selection to find the optimal smoothing parameter #
q_s1 = logspace(-6, 7, 10)
gcv1 = rep(0, 10)

for (j in 1:10) {

  result = Estimate_PLMODS(X,Y,Z,n_f,eta00,q_s1[j],Cpt,mu_Y,sig_Y)
  etajj = matrix(c(result$alpha, result$gam, result$pi0, result$v0, result$sig0_sq0), ncol=1)
  gcv1[j] = gcv_ODS(X,Y,Z,n_f,etajj,q_s1[j],Cpt,mu_Y,sig_Y)
}

b = which(gcv1 == min(gcv1))
q_s = q_s1[b]

q_s

# Estimation of the partial linear model in the setting of outcome-dependent sampling #
result = Estimate_PLMODS(X, Y, Z, n_f, eta00, q_s, Cpt, mu_Y, sig_Y)
result
## End(No test)



