library(GsymPoint)


### Name: gsym.point
### Title: Construction of confidence intervals for the Generalized
###   Symmetry point and its accuracy measures through two methods
### Aliases: gsym.point

### ** Examples

library(GsymPoint)

data(melanoma)

###########################################################
# marker: X
# status: group
###########################################################

###########################################################
# Generalized Pivotal Quantity Method ("GPQ"): 
# Original data normally distributed
###########################################################

gsym.point.GPQ.melanoma<-gsym.point(methods = "GPQ", data = melanoma,
marker = "X", status = "group", tag.healthy = 0, categorical.cov = NULL, 
CFN = 1, CFP = 1, control = control.gsym.point(),confidence.level = 0.95, 
trace = FALSE, seed = FALSE, value.seed = 3, verbose = FALSE)

summary(gsym.point.GPQ.melanoma)

plot(gsym.point.GPQ.melanoma)


data(prostate)

###########################################################
# marker: marker
# status: status
###########################################################

###########################################################
# Generalized Pivotal Quantity Method ("GPQ"): 
# Box-Cox transformed data normally distributed
###########################################################

gsym.point.GPQ.prostate <- gsym.point (methods = "GPQ", data = prostate,
marker = "marker", status = "status", tag.healthy = 0, categorical.cov = NULL, 
CFN = 1, CFP = 1, control = control.gsym.point(), confidence.level = 0.95, 
trace = FALSE, seed = FALSE, value.seed = 3, verbose = FALSE)

summary(gsym.point.GPQ.prostate)

plot(gsym.point.GPQ.prostate)


data(elastase)

###########################################################
# marker: elas
# status: status
###########################################################

###########################################################
# Generalized Pivotal Quantity Method ("GPQ"):
# Original data not normally distributed 
# Box-Cox transformed data not normally distributed
###########################################################

gsym.point.GPQ.elastase <- gsym.point(methods = "GPQ", data = elastase, 
marker = "elas", status = "status", tag.healthy = 0, categorical.cov = NULL, 
CFN = 1, CFP = 1, control = control.gsym.point(), confidence.level = 0.95, 
trace = FALSE, seed = FALSE, value.seed = 3, verbose = FALSE) 

summary(gsym.point.GPQ.elastase)

plot(gsym.point.GPQ.elastase)




