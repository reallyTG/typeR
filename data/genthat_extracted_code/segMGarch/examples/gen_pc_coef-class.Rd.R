library(segMGarch)


### Name: gen_pc_coef-class
### Title: A method to generate piecewise constant coefficients
### Aliases: gen_pc_coef-class gen_pc_coef gen_pc_coef-methods
###   gen_pc_coef,simMGarch-method

### ** Examples

pw.CCC.obj <- new("simMGarch")
coef.vector <- gen_pc_coef(pw.CCC.obj,c(0.2,0.4))
ts.plot(coef.vector,main="piecewise constant coefficients",ylab="coefficient",xlab="time")



