library(multisensi)


### Name: analysis.anoasg
### Title: Runs a series of analyses of variance
### Aliases: analysis.anoasg
### Keywords: sensitivity analysis

### ** Examples

# Test case : the Winter Wheat Dynamic Models (WWDM)
#  input factors design
 data(biomasseX)
# output variables (precalculated to speed up the example)
 data(biomasseY)

 res <- analysis.anoasg(biomasseY, biomasseX, 
                        nbcomp = 2, sigma.car = NULL,
                        analysis.args = list(formula = 2,
                                             keep.outputs = FALSE))




