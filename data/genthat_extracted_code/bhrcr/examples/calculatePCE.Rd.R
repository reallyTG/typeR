library(bhrcr)


### Name: calculatePCE
### Title: WWARN Parasite Clearance Estimator (PCE)
### Aliases: calculatePCE

### ** Examples

## Don't show: 
data("pursat")
data = pursat[pursat["id"] <= 80 & pursat["id"] > 70,]
output <- calculatePCE(data = data, detect.limit = 15, outlier.detect = TRUE)
## End(Don't show)
## No test: 
data("pursat")
output <- calculatePCE(data = pursat, detect.limit = 15, outlier.detect = TRUE)
## End(No test)



