library(OptimalCutpoints)


### Name: print.optimal.cutpoints
### Title: Print method for optimal.cutpoints objects
### Aliases: print.optimal.cutpoints

### ** Examples

library(OptimalCutpoints)
data(elas)
###########################################################
# Youden Index Method ("Youden"): Covariate gender
###########################################################
optimal.cutpoint.Youden<-optimal.cutpoints(X = "elas", status = "status", tag.healthy = 0, 
methods = "Youden", data = elas, pop.prev = NULL, categorical.cov = "gender", 
control = control.cutpoints(), ci.fit = TRUE, conf.level = 0.95, trace = FALSE)

optimal.cutpoint.Youden

print(optimal.cutpoint.Youden)  



