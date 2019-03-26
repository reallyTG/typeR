library(GsymPoint)


### Name: summary.gsym.point
### Title: Summary method for gsym.point objects
### Aliases: summary.gsym.point

### ** Examples

library(GsymPoint)

data(melanoma)

###########################################################
# Generalized Pivotal Quantity Method ("GPQ"): 
###########################################################

gsym.point.GPQ.melanoma<-gsym.point(methods = "GPQ", data = melanoma,
marker = "X", status = "group", tag.healthy = 0, categorical.cov = NULL, 
CFN = 1, CFP = 1, control = control.gsym.point(),confidence.level = 0.95, 
trace = FALSE, seed = FALSE, value.seed = 3, verbose = FALSE)

summary(gsym.point.GPQ.melanoma)


data(prostate)

###########################################################
# Generalized Pivotal Quantity Method ("GPQ"): 
###########################################################

gsym.point.GPQ.prostate <- gsym.point (methods = "GPQ", data = prostate,
marker = "marker", status = "status", tag.healthy = 0, categorical.cov = NULL, 
CFN = 1, CFP = 1, control = control.gsym.point(), confidence.level = 0.95, 
trace = FALSE, seed = FALSE, value.seed = 3, verbose = FALSE)

summary(gsym.point.GPQ.prostate)


data(elastase)

###########################################################
# Generalized Pivotal Quantity Method ("GPQ"): 
###########################################################

gsym.point.GPQ.elastase <- gsym.point(methods = "GPQ", data = elastase, 
marker = "elas", status = "status", tag.healthy = 0, categorical.cov = NULL, 
CFN = 1, CFP = 1, control = control.gsym.point(), confidence.level = 0.95, 
trace = FALSE, seed = FALSE, value.seed = 3, verbose = FALSE) 

summary(gsym.point.GPQ.elastase)




