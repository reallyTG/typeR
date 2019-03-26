library(OptimalCutpoints)


### Name: plot.optimal.cutpoints
### Title: Default optimal.cutpoints plotting
### Aliases: plot.optimal.cutpoints

### ** Examples

library(OptimalCutpoints)
data(elas)
###########################################################
# Youden Index method ("Youden"): Covariate gender
###########################################################
optimal.cutpoint.Youden<-optimal.cutpoints(X = "elas", status = "status", tag.healthy = 0, 
methods = "Youden", data = elas, pop.prev = NULL, categorical.cov = "gender", 
control = control.cutpoints(), ci.fit = TRUE, conf.level = 0.95, trace = FALSE)

# Plot by default
plot(optimal.cutpoint.Youden)

#  Not including the optimal coordinates
plot(optimal.cutpoint.Youden, legend = FALSE)
# Change the colour
plot(optimal.cutpoint.Youden, col = "blue")    



