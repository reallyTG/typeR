library(refund)


### Name: bayes_fosr
### Title: Bayesian Function-on-scalar regression
### Aliases: bayes_fosr

### ** Examples


## Not run: 
##D 
##D library(reshape2)
##D library(dplyr)
##D library(ggplot2)
##D 
##D ##### Cross-sectional real-data examples #####
##D 
##D ## organize data
##D data(DTI)
##D DTI = subset(DTI, select = c(cca, case, pasat))
##D DTI = DTI[complete.cases(DTI),]
##D DTI$gender = factor(sample(c("male","female"), dim(DTI)[1], replace = TRUE))
##D DTI$status = factor(sample(c("RRMS", "SPMS", "PPMS"), dim(DTI)[1], replace = TRUE))
##D 
##D ## fit models
##D default = bayes_fosr(cca ~ pasat, data = DTI)
##D VB = bayes_fosr(cca ~ pasat, data = DTI, Kp = 4, Kt = 10)
##D Gibbs = bayes_fosr(cca ~ pasat, data = DTI, Kt = 10, est.method = "Gibbs", cov.method = "Wishart",
##D                    N.iter = 500, N.burn = 200)
##D OLS = bayes_fosr(cca ~ pasat, data = DTI, Kt = 10, est.method = "OLS")
##D GLS = bayes_fosr(cca ~ pasat, data = DTI, Kt = 10, est.method = "GLS")
##D 
##D ## plot results
##D models = c("default", "VB", "Gibbs", "OLS", "GLS")
##D intercepts = sapply(models, function(u) get(u)$beta.hat[1,])
##D slopes = sapply(models, function(u) get(u)$beta.hat[2,])
##D 
##D plot.dat = melt(intercepts); colnames(plot.dat) = c("grid", "method", "value")
##D ggplot(plot.dat, aes(x = grid, y = value, group = method, color = method)) + 
##D    geom_path() + theme_bw()
##D 
##D plot.dat = melt(slopes); colnames(plot.dat) = c("grid", "method", "value")
##D ggplot(plot.dat, aes(x = grid, y = value, group = method, color = method)) + 
##D    geom_path() + theme_bw()
##D 
##D ## fit a model with an interaction
##D fosr.dti.interaction = bayes_fosr(cca ~ pasat*gender, data = DTI, Kp = 4, Kt = 10)
##D 
##D 
##D ##### Longitudinal real-data examples #####
##D 
##D data(DTI2)
##D class(DTI2$cca) = class(DTI2$cca)[-1]
##D DTI2 = subset(DTI2, select = c(cca, id, pasat))
##D DTI2 = DTI2[complete.cases(DTI2),]
##D 
##D default = bayes_fosr(cca ~ pasat + re(id), data = DTI2)
##D VB = bayes_fosr(cca ~ pasat + re(id), data = DTI2, Kt = 10, cov.method = "Wishart")
##D 
## End(Not run)




