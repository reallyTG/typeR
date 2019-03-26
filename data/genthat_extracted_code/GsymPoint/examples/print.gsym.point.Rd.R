library(GsymPoint)


### Name: print.gsym.point
### Title: Print method for gsym.point objects
### Aliases: print.gsym.point

### ** Examples

library(GsymPoint)
data(elastase)

###########################################################
# Empirical Likelihood Method ("GPQ"): 
###########################################################

gsym.point.GPQ.elastase<-gsym.point(methods = "GPQ", data = elastase, marker = "elas", 
status = "status", tag.healthy = 0, categorical.cov = NULL, CFN = 1, CFP = 1, 
control = control.gsym.point(), confidence.level = 0.95, trace = FALSE, 
seed = FALSE, value.seed = 3, verbose = FALSE) 

gsym.point.GPQ.elastase

print(gsym.point.GPQ.elastase)




