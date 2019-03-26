library(PanJen)


### Name: choose.fform
### Title: Compare a number of user-specified transformations with a
###   semiparametric smoothing and a model without the variable
### Aliases: choose.fform

### ** Examples

## Test a linear specification (x), a log (I(log(x))) and a square I(x^2))
library(PanJen) 
data("hvidovre")
form<-formula(lprice ~brick+roof_tile+roof_cemen+rebuild90+rebuild00+y7+y8+y9)
fxlist= list(
  linear = function(x) x,
  sqr = function(x) x^2,
  log=function(x) log(x)
)
  
PanJenAreaC<-choose.fform(data=hvidovre,variable="area",base_form=form, functionList=fxlist) 



