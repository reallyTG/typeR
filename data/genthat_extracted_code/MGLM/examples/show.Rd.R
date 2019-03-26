library(MGLM)


### Name: show
### Title: Show an object
### Aliases: show show,MGLMfit-method show,MGLMreg-method
###   show,MGLMsparsereg-method show,MGLMtune-method

### ** Examples

library("MGLM")
data("rnaseq")
data <- rnaseq[, 1:6]
gdmFit <- MGLMfit(data, dist = "GDM")
show(gdmFit)



