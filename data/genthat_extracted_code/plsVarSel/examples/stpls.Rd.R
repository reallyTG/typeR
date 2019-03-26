library(plsVarSel)


### Name: stpls
### Title: Soft-Threshold PLS (ST-PLS)
### Aliases: stpls

### ** Examples

data(yarn, package = "pls")
st <- stpls(density~NIR, ncomp=5, shrink=c(0.1,0.2), validation="CV", data=yarn)
summary(st)




