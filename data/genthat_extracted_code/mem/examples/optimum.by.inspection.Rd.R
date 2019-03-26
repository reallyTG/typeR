library(mem)


### Name: optimum.by.inspection
### Title: Inspection calcultation of the optimum
### Aliases: optimum.by.inspection
### Keywords: influenza

### ** Examples

## No test: 
# Castilla y Leon Influenza Rates data
data(flucyl)
# Inspection. It runs interactively (uncomment to run)
opt.ins<-optimum.by.inspection(flucyl,i.param.values=seq(2.0,3.0,0.1))
opt.ins$optimum
## End(No test)




