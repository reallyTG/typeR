library(OptimalCutpoints)


### Name: summary.optimal.cutpoints
### Title: Summary method for optimal.cutpoints objects
### Aliases: summary.optimal.cutpoints

### ** Examples

library(OptimalCutpoints)
data(elas)
###########################################################
# Youden Index Method ("Youden"): Covariate gender
###########################################################
optimal.cutpoint.Youden<-optimal.cutpoints(X = "elas", status = "status", tag.healthy = 0, 
methods = "Youden", data = elas, pop.prev = NULL, categorical.cov = "gender", 
control = control.cutpoints(), ci.fit = TRUE, conf.level = 0.95, trace = FALSE)

summary(optimal.cutpoint.Youden) 



