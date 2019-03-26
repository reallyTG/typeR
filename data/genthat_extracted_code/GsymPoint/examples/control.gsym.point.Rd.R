library(GsymPoint)


### Name: control.gsym.point
### Title: Control of the Generalized Symmetry point computing process
### Aliases: control.gsym.point

### ** Examples

library(GsymPoint)

data(melanoma)

###########################################################
# Generalized Pivotal Quantity Method ("GPQ"): 
###########################################################

# How to set the number of replicates I equal to 2000:

gsym.point.GPQ.melanoma<-gsym.point(methods = "GPQ", data = melanoma,
marker = "X", status = "group", tag.healthy = 0, categorical.cov = NULL, 
CFN = 1, CFP = 1, control = control.gsym.point(I = 2000),
confidence.level = 0.95, trace = FALSE, seed = FALSE, value.seed = 3, verbose = FALSE)

summary(gsym.point.GPQ.melanoma)


data(prostate)

###########################################################
# Empirical Likelihood Method ("EL")
###########################################################

# How to set the number of resamples B equal to 99:

gsym.point.GPQ.prostate <- gsym.point (methods = "GPQ", data = prostate,
marker = "marker", status = "status", tag.healthy = 0, categorical.cov = NULL, 
CFN = 1, CFP = 1, control = control.gsym.point(B=99), confidence.level = 0.95, 
trace = FALSE, seed = FALSE, value.seed = 3, verbose = FALSE)

summary(gsym.point.GPQ.prostate)




