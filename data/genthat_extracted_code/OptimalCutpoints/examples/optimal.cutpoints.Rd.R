library(OptimalCutpoints)


### Name: optimal.cutpoints
### Title: Computing Optimal Cutpoints in diagnostic tests
### Aliases: optimal.cutpoints optimal.cutpoints.default
###   optimal.cutpoints.formula

### ** Examples

library(OptimalCutpoints)
data(elas)
####################
# marker: elas
# status: status
# categorical covariates:
#		gender
####################

###########################################################
# Youden Index Method ("Youden"): Covariate gender
###########################################################
# Defaut method
optimal.cutpoint.Youden <- optimal.cutpoints(X = "elas", status = "status", tag.healthy = 0, 
methods = "Youden", data = elas, pop.prev = NULL, categorical.cov = "gender", 
control = control.cutpoints(), ci.fit = FALSE, conf.level = 0.95, trace = FALSE)

summary(optimal.cutpoint.Youden)

plot(optimal.cutpoint.Youden)

# Formula method
optimal.cutpoint.Youden <- optimal.cutpoints(X = elas ~ status, tag.healthy = 0, 
methods = "Youden", data = elas, pop.prev = NULL, categorical.cov = "gender", 
control = control.cutpoints(), ci.fit = FALSE, conf.level = 0.95, trace = FALSE)

#  Inference on the test accuracy measures
optimal.cutpoint.Youden <- optimal.cutpoints(X = "elas", status = "status", tag.healthy = 0, 
methods = "Youden", data = elas, pop.prev = NULL, categorical.cov = "gender", 
control = control.cutpoints(), ci.fit = TRUE, conf.level = 0.95, trace = FALSE)

summary(optimal.cutpoint.Youden)

##########################################################################
# Sensitivity equal to Specificity Method ("SpEqualSe"): Covariate gender
##########################################################################
optimal.cutpoint.SpEqualSe <- optimal.cutpoints(X = "elas", status = "status", tag.healthy = 0, 
methods = "SpEqualSe", data = elas, pop.prev = NULL, categorical.cov = "gender", 
control = control.cutpoints(), ci.fit = TRUE, conf.level = 0.95, trace = FALSE)

summary(optimal.cutpoint.SpEqualSe)

plot(optimal.cutpoint.SpEqualSe)  




