library(OptimalCutpoints)


### Name: control.cutpoints
### Title: Controlling the optimal-cutpoint selection process
### Aliases: control.cutpoints

### ** Examples

library(OptimalCutpoints)
data(elas)

###########################################################
# Youden Index Method ("Youden"): Covariate gender
###########################################################
optimal.cutpoint.Youden<-optimal.cutpoints(X = "elas", status = "status", tag.healthy = 0, 
methods = "Youden", data = elas, pop.prev = NULL, categorical.cov = 
"gender", control = control.cutpoints(), ci.fit = TRUE, conf.level = 0.95, trace = FALSE)

summary(optimal.cutpoint.Youden)

# Change the method for computing the confidence interval 
# of Sensitivity and Specificity measures
optimal.cutpoint.Youden<-optimal.cutpoints(X = "elas", status = "status", tag.healthy = 0, 
methods = "Youden", data = elas, pop.prev = NULL, categorical.cov = "gender", 
control = control.cutpoints(ci.SeSp = "AgrestiCoull"), ci.fit = TRUE, conf.level = 0.95, 
trace = FALSE)

summary(optimal.cutpoint.Youden)

# Compute the Generalized Youden Index
optimal.cutpoint.Youden<-optimal.cutpoints(X = "elas", status = "status", tag.healthy = 0, 
methods = "Youden", data = elas, pop.prev = NULL, categorical.cov = "gender", 
control = control.cutpoints(generalized.Youden = TRUE), ci.fit = TRUE, conf.level = 0.95, 
trace = FALSE)

summary(optimal.cutpoint.Youden)
                                 



