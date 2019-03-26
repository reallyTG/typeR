library(sensors4plumes)


### Name: optimisationCurve
### Title: Plot Optimisation Curve
### Aliases: optimisationCurve

### ** Examples

data(SDgreedy)
curve_greedy1 = optimisationCurve(
  optSD = SDgreedy,
  type = "greedy")

data(SDgenetic)
curve_genetic1 = optimisationCurve(
  optSD = SDgenetic,
  type = "genetic")

data(SDglobal)
curve_global1 = optimisationCurve(
  optSD = SDglobal,
  type = "global")
  
data(SDmanual)  
curve_manual1 = optimisationCurve(
  optSD = SDmanual,
  type = "manual")


data(SDssa)
curve_ssa1 = optimisationCurve(
  optSD = SDssa,
  type = "ssa")

  
## Not run: 
##D # generates a file
##D curve_global1 = optimisationCurve(
##D   optSD = SDglobal,
##D   type = "global",
##D   nameSave = "optSD_global",
##D   width = 600, height = 300)
## End(Not run)  



